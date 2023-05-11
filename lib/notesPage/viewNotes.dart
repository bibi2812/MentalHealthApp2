import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:setap/notesPage/widgets/viewBody.dart';
import 'package:setap/calendar/calendar.dart';

// global variables for extracting saved values
// used by viewNotes class for getBox()
String? __globDate = "";
String? __globMood = "";

class Notes extends StatefulWidget {
  Notes({super.key});

  @override
  viewNotes createState() => viewNotes();
}

class viewNotes extends State<Notes> {

  //read data
void readData() {
  List<String> notes = _myBox.get();
  /* for (String note in notes) {
    List<String> data = note.split('\n');
    print('Date = ${data[0]}');
    print('Mood-Score = ${data[1]}');
  } */
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton (onPressed: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context)
        {
          return const addNote();
        });
      },
        child: const Icon(Icons.add),
      ),
      body: const viewNotesBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home...",
            backgroundColor: Colors.greenAccent
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Notes...",
        backgroundColor: Colors.amber
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
          backgroundColor: Colors.blueGrey
        )
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
          this.context,
          MaterialPageRoute(builder: (context) => const Calendar())
      );
    }
  }
}

class addNote extends StatelessWidget {
  const addNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: addNoteForm(),
      ),
    );
  }
}

class addNoteForm extends StatefulWidget {
  const addNoteForm({Key? key}) : super(key: key);

  @override
  State<addNoteForm> createState() => _addNoteFormState();
}

class _addNoteFormState extends State<addNoteForm>{
  final _box = Hive.box('notes_box');

  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String ? date, moodScore;

  // write data
  void _writeData(String date, mood) {
    var newNote = [date, mood];
    _box.add(newNote);
  }

    @override
    Widget build(BuildContext context) {
      return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
           CustomTextField(
            onSaved: (value) {
              date = value;
              // provides the user with a shortcut if they leave the date field empty
              if (date != null) {
                __globDate = value;
              } else {
                __globDate = DateTime.now().toString();
              }

            },
            hint: "Date",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              moodScore = value;
              if (value != null) {
                __globMood = value;
              } else {
                __globMood = """No mood recorded- please remember to update your
                notes or delete this card.""";
              }

            },
            hint: "Content",
            maxLines: 10,
          ),
          const SizedBox(
            height: 16,
          ),
           bottomButton(
            onTap: (){
              if(formKey.currentState!.validate())
                {
                  formKey.currentState!.save();
                  _writeData(__globDate!, __globMood);
                } else {
                autovalidateMode = AutovalidateMode.always;
                setState((){
              });
            }}
          ),
          const SizedBox(
            height: 16,
          ),
        ],
        ),
      );
    }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField ({super.key, required this.hint, this.maxLines = 1, this.onSaved});

  final String hint;
  final int maxLines;

  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if(value?.isEmpty ?? true) {
          return "Field is required";
        } else
          {return null;}
      },
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: (hint),
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(Colors.purple),
        focusedBorder: buildBorder(Colors.red),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        8,
      ),
      borderSide: const BorderSide(
        color: Colors.blue,
      ),);
  }
}

class bottomButton extends StatelessWidget {
  const bottomButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build (BuildContext context) {
    return GestureDetector(
    onTap: onTap,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.amber,
            borderRadius: BorderRadius.circular(8
      )),
      child: const Center(
        child: Text ("Save",
          style: TextStyle(
            color: Colors.black
          ),),
      ),
    ),);
  }
}
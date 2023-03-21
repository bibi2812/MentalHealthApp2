import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:setap/notesPage/widgets/viewBody.dart';

class viewNotes extends StatelessWidget {
  const viewNotes ({Key? key}) : super(key: key);

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
    );
  }
}

class addNote extends StatelessWidget {
  const addNote ({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
      child: SingleChildScrollView(
      child:Column(
      children: const [
        SizedBox(
          height: 32,
        ),
        CustomTextField(
          hint: "Date",
        ),
        SizedBox(
          height: 16,
        ),
        CustomTextField(
          hint: "Content",
          maxLines: 10,
        ),
        SizedBox(
          height: 16,
        ),
        bottomButton(),
        SizedBox(
          height: 16,
        ),
      ],
    ),
      ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField ({Key? key, required this.hint, this.maxLines = 1}) : super(key: key);

  final String hint;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
  const bottomButton({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Container(
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
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../editNotes.dart';

// appBar is the bar positioned at the top of the screen. It is called by
// viewNotesBody class (vNtsBdy calls the appBar and the list of green bars).
// appBar holds a heading and a search icon which the client will be able to use
// in order to find previously saved notes more quickly.
class appBar extends StatelessWidget {
  const appBar ({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(title,
           style: const TextStyle(
             fontSize: 28,
        ),
        ),
        const Spacer(),
        CustomIcon(
          icon: icon,
        ),
      ],
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: IconButton(
          onPressed: (){},
          icon: Icon(
            icon,
              size: 28,
          ),
        ),
    );
  }
}

// viewNotesBody returns a bar at the top of the screen with a scrollable list
// of mood ratings.
class viewNotesBody extends StatelessWidget {
  const viewNotesBody ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric (horizontal: 24),
      child: Column(
        children: const [
        SizedBox(
          height: 50,
        ),
        appBar(
          title: "Notes",
          icon: Icons.search,
        ),
        Expanded ( child:notesList()),
      ],
    ),
    );
  }
}

// itemNotes are the green bars that contain each of the mood scores as well as
// the dates they were written on.
class itemNotes extends StatelessWidget {
  final _noteBox = Hive.box('notes_box');
  final int index;

  itemNotes (this.index, {super.key});

  // _getNote returns either the recorded date or mood based on a given index
  // dateOrMood must either be "date" or "mood"; anything else returns an error
  // string (which will be written into the item Boxes!).
  String _getNote(int index, String dateOrMood) {
    var note = _noteBox.get(index);

    if (note != null) {
      if (dateOrMood == "date") {
        return note[0];
      } else if (dateOrMood == "mood") {
        return note[1];
      } else {
        return "err- invalid second parameter passed for date or mood.";
      }
    } else {
      return dateOrMood;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const editNote();
        }),);
      },
      child: Container(
      padding: const EdgeInsets.only(top:20,bottom: 20, left:16),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(16),
    ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(_getNote(index, "date"),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 26,
            ),
            ),
            subtitle: Text(_getNote(index, "mood"),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            ),
            trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.delete,
            color: Colors.black,
              size: 25,
            ),
            ),
          ),
        ],
      ),
    ),);
  }
}

class notesList extends StatelessWidget {
  const notesList ({Key? key}) : super(key:key);

  @override
  Widget build (BuildContext context){
    return Padding (
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ListView.builder (itemBuilder : (context , index)
      {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: itemNotes(index),
        );
      }),
    );
  }
}
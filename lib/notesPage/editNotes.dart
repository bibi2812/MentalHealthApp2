import 'package:flutter/material.dart';
import 'package:setap/notesPage/viewNotes.dart';
import 'package:setap/notesPage/widgets/viewBody.dart';


class editNote extends StatelessWidget{
  const editNote ({Key? key}) : super (key: key);

  @override
  Widget build (BuildContext context) {
    return const Scaffold(
      body: editNoteBody(),
    );
  }
}

class editNoteBody extends StatelessWidget{
  const editNoteBody ({Key? key}) : super (key: key);

  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric (horizontal: 24),
    child: Column(
      children: const [
        SizedBox(
          height: 50,
        ),
        appBar(
          title: "Edit note",
          icon: Icons.check,
        ),
        SizedBox(
          height: 50,
        ),
        CustomTextField(hint: 'Date'),
        SizedBox(
          height: 16,
        ),
        CustomTextField (hint: 'Content',
        maxLines: 10,
        ),
      ],
    ),
    );
  }
}
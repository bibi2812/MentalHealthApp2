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
          return Container();
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
      padding: EdgeInsets.symmetric(horizontal: 16),
      child:Column(
      children: const [
        SizedBox(
          height: 32,
        ),
        textField(),
      ],
    ),
    );
  }
}

class textField extends StatelessWidget {
  const textField ({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder (const Color(0xffa12828))),
      );
  }
  OutlineInputBorder buildBorder([color]){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        8,
      ),
      borderSide: BorderSide(
        color: color ?? Colors.blue,
    ),);
  }
}

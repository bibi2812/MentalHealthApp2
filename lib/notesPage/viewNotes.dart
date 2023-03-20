import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:setap/notesPage/widgets/viewBody.dart';

class viewNotes extends StatelessWidget {
  const viewNotes ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: viewNotesBody(),
    );
  }
}


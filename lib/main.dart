import 'package:flutter/material.dart';
import 'notesPage/viewNotes.dart';

void main(){
  runApp(const MentalHealthApp());
}

class MentalHealthApp extends StatelessWidget {
  const MentalHealthApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(brightness: Brightness.light),
        home: const viewNotes(),
    );
  }
}

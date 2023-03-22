import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'notesPage/viewNotes.dart';

void main() async{
  await Hive.initFlutter();

  await Hive.openBox('notes_box');

  runApp(const MentalHealthApp());
}

class MentalHealthApp extends StatelessWidget {
  const MentalHealthApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light),
        home: const viewNotes(),
    );
  }
}

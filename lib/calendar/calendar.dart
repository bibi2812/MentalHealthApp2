import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:setap/models/quotes_model.dart';
import '../notesPage/viewNotes.dart';
import 'quotes.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<Calendar> {
  String randQuote = "loading...";

  @override
  void initState() {
    super.initState();
    loadQuote();
  }

  void loadQuote() async {
    print("Loading csv...");
    String fileData = await rootBundle.loadString("../../MentalHealthAppQuotes.txt");
    print(fileData);

    List<String> rows = fileData.split("\n");

    print("Opening quotes box...");
    var quotesFile = await Hive.openBox('quotes_box');

    for (int i = 0; i < rows.length; i++) {
      String row = rows[i];
      quotesFile.put(i, row);
      print("Current note added to db: " + quotesFile.get(i));
    }

    var contents = await getRandomQuote(quotesFile); // call to method
    print(contents);
    randQuote = contents;
    setState(() {}); // update state
  }

  Future<String> getRandomQuote(Box quoteBox) async {
    print("Opened file.\nReading contents...");
    var rng = Random();
    var key = rng.nextInt(140);
    return quoteBox.get(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(randQuote), // Display quote
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Card(
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now(),
                  onDateChanged: (DateTime value) {},
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: FilledButton(
                child: const Text("Does nothing yet!"),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home...",
            backgroundColor: Colors.greenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Notes...",
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
            backgroundColor: Colors.blueGrey,
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Notes()),
        );
      }
    });
  }
}

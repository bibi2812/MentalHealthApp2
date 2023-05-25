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
        backgroundColor: const Color(0xff4e9286),
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xff5d4e40),
            ),
            label: "Home...",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.book,
                color: Color(0xff5d4e40),
            ),
            label: "Notes...",
            backgroundColor: Color(0xff5d4e40),
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.settings,
              color: Color(0xff5d4e40),
            ),
            label: "Settings",
            backgroundColor: Color(0xff5d4e40),
          ),
        ],
        onTap: _onItemTapped,
        backgroundColor: const Color(0xfff3ce91),
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

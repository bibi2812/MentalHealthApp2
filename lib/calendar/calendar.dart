import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
    print("Reading quotes db...");
    var quotesFile = await Hive.openBox('quotes_box');

    String contents = await getRandomQuote(); //call to method
    randQuote = contents;
    setState(() {}); // update state
  }

  Future<String> getRandomQuote() async {
    print("Opened file.\nReading contents...");
    // String contents = await quotesFile.readAsString(); // Unsupported operation: _Namespace ????
    // print(contents);
    // var randoQuotes = quotes;
    // var rng = Random();

    // randQuote = randoQuotes[rng.nextInt(8)];
    return "Under Maintenance";
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

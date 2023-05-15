import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'quotes.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<Calendar> {
  //declare variables
  late Box<NotesModel> quotesBox; 
  late String randQuote;

  @override
  void initState() {
    super.initState();
    getRandomQuote(); //call to method
  }

  Future<void> getRandomQuote() async {
    await Hive.initFlutter();
    await Hive.openBox<NotesModel>('quotes_box');

    // Retrieve the quotes from the Hive box
    quotesBox = Hive.box<NotesModel>('quotes_box');
    List<NotesModel> quotes = quotesBox.values.toList();

    // Select a random quote
    final Random random = Random();
    final int randIndex = random.nextInt(quotes.length);
    randQuote = quotes[randIndex].quote;

    setState(() {}); // update state
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
          MaterialPageRoute(builder: (context) => Notes()),
        );
      }
    });
  }
}

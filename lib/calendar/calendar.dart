import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome. Namaste..."),
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
                      onDateChanged: (DateTime value) {}
                  ),
                )
            ),
            Positioned(
              // places the FilledButton 10 pixels from the bottom
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
              backgroundColor: Colors.greenAccent
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Notes...",
              backgroundColor: Colors.amber
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
              backgroundColor: Colors.blueGrey
          )
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  // _onItemTapped checks when the bottom navigation bar was clicked
  void _onItemTapped(int index) {
    setState(() {
      print('Tapped $index');
    });

  }
}
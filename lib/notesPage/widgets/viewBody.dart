import 'package:flutter/material.dart';

import 'appBar.dart';

class viewNotesBody extends StatelessWidget {
  const viewNotesBody ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 50,
        ),
        appBar(),
        itemNotes(),
      ],
    );
  }
}

class itemNotes extends StatelessWidget {
  const itemNotes ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:20,bottom: 20, left:16),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(16),
    ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text("Date",
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
            ),
            ),
            subtitle: const Text("Mood Score",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            ),
            trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.delete,
            color: Colors.black,
              size: 25,
            ),
            ),
          ),
        ],
      ),
    );
  }
}
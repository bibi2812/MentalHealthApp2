import 'package:flutter/material.dart';

import '../editNotes.dart';

class appBar extends StatelessWidget {
  const appBar ({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const[
        Text('Notes', style: TextStyle(
          fontSize: 28,
        ),
        ),
        Spacer(),
        searchIcon(),
      ],
    );
  }
}

class searchIcon extends StatelessWidget {
  const searchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.2), borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Icon(Icons.search,
          ),
        )
    );
  }
}

class viewNotesBody extends StatelessWidget {
  const viewNotesBody ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric (horizontal: 24),
      child: Column(
        children: const [
        SizedBox(
          height: 50,
        ),
        appBar(),
        Expanded ( child:notesList()),
      ],
    ),
    );
  }
}

class itemNotes extends StatelessWidget {
  const itemNotes ({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context ){
          return const editNote();
        }),);
      },
      child: Container(
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
    ),);
  }
}

class notesList extends StatelessWidget {
  const notesList ({Key? key}) : super(key:key);

  @override
  Widget build (BuildContext context){
    return Padding (
      padding: EdgeInsets.symmetric(vertical: 15),
      child: ListView.builder (itemBuilder : (context , index)
      {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: itemNotes(),
        );
      }),
    );
  }
}
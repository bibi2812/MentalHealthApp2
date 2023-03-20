import 'package:flutter/material.dart';

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
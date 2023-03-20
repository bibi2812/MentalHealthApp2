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
        appBar()
      ],
    );
  }
}

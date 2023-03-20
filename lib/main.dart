import 'dart:core';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'data.dart';

List<DataBase> dataBase = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String csv = "../assets/data.csv";
  String fileData = await rootBundle.loadString(csv);
  print(fileData);
  List <String> rows = fileData.split("\n");
  for (int i = 0; i < rows.length; i++)  {
    //selects an item from row and places
    String row = rows[i];
    List <String> itemInRow = row.split(",");
    DataBase db = DataBase(
        int.parse(itemInRow[0]),
        int.parse(itemInRow[1]),
        itemInRow[2]
    );
    dataBase.add(db);
  }

  runApp (
    const MaterialApp(
      home: MyFlutterApp(),
    ),
  );
}

class MyFlutterApp extends StatefulWidget {
  const MyFlutterApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyFlutterState();
  }
}

class MyFlutterState extends State<MyFlutterApp>{
  late int dateID;
  late int ratingID;
  String entryID = "";

  @override
  void initState() {
    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        //PLACE CODE HERE YOU WANT TO EXECUTE IMMEDIATELY AFTER
        //THE UI IS BUILT

        DataBase current = dataBase.first;
        dateID = current.dateID;
        ratingID = current.ratingID;
        entryID = current.entryID;
        print("dataID, ratingID: "+ current.dateID.toString() + "," +current.ratingID.toString());
      });
    });
  }

  void clickHandler() {
    setState(() {
      print('clickHandler');
      for (DataBase db in dataBase) {

        if (db.dateID == ratingID) {
          print("dateID: " + db.dateID.toString());
          dateID = db.dateID;
          ratingID = db.ratingID;
          entryID = db.entryID;
          print(entryID);
          break;
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Color(0xff3e87c5),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Align(
                alignment: const Alignment(0.0, 0.0),
                child: MaterialButton(
                  onPressed: () {clickHandler() ;},
                  color: const Color(0xff3a21d9),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  textColor: const Color(0xfffffdfd),
                  height: 40,
                  minWidth: 140,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    "Text Button",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              )
              , Align(
                alignment: const Alignment(0.0, -0.7),
                child: Text(
                  entryID,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 34,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:hive/hive.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 0)
class notesModel extends HiveObject {

  @HiveField(0)
  final String date;

  @HiveField(1)
  final String moodScore;

  @HiveField(2)
  final int color;

  notesModel({
    required this.date,
    required this.moodScore,
    required this.color
  });
}

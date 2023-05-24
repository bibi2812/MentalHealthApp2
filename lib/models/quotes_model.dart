import 'package:hive/hive.dart';

part 'quotes_model.g.dart';

@HiveType(typeId: 1)
class quotesModel extends HiveObject {

  @HiveField(0)
  final String quote;

  quotesModel({
    required this.quote,
  });
}

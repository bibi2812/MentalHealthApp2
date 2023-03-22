// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class notesModelAdapter extends TypeAdapter<notesModel> {
  @override
  final int typeId = 0;

  @override
  notesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return notesModel(
      date: fields[0] as String,
      moodScore: fields[1] as String,
      color: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, notesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.moodScore)
      ..writeByte(2)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is notesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

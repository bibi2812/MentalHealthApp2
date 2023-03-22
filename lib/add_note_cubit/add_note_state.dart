part of 'add_note_cubit.dart';

@immutable
abstract class addNoteState {}

class addNoteInitial extends addNoteState{}
class addNoteLoading extends addNoteState{}
class addNoteSuccess extends addNoteState{}
class addNoteFailure extends addNoteState{
  final String errMessage;

  addNoteFailure(this.errMessage);
}
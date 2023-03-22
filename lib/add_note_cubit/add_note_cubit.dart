import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import '../models/notes_model.dart';

part 'add_note_state.dart';

class addNoteCubit extends Cubit<addNoteState> {
  addNoteCubit() : super(addNoteInitial());

  addNote(notesModel note) async {
    emit(addNoteLoading());
    try {
      var notesBox = Hive.box<notesModel>('notes_box');
      emit(addNoteSuccess());
      await notesBox.add(note);
    } catch (e) {
    addNoteFailure(e.toString());
    }
  }
}


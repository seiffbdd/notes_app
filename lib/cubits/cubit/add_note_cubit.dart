import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app2/constants.dart';
import 'package:notes_app2/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) {
    emit(AddNoteLoading());
    try {
      Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
      notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFairlure(errMessage: e.toString()));
    }
  }
}

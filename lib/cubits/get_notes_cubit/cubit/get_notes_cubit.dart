import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app2/constants.dart';
import 'package:notes_app2/models/note_model.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitial());

  getNotes() {
    try {
      Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);

      emit(GetNotesSuccess(notes: notesBox.values.toList()));
    } catch (e) {
      emit(GetNotesFailure(errMessage: e.toString()));
    }
  }
}

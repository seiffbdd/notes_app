import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app2/constants.dart';
import 'package:notes_app2/cubits/get_notes_cubit/cubit/get_notes_cubit.dart';
import 'package:notes_app2/models/note_model.dart';
import 'package:notes_app2/simple_bloc_observer.dart';
import 'package:notes_app2/view/edit_note_view.dart';
import 'package:notes_app2/view/notes_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        routes: {
          NotesView.notesViewPath: (context) => const NotesView(),
          EditNoteView.editNoteViewPath: (context) => EditNoteView()
        },
        initialRoute: NotesView.notesViewPath,
      ),
    );
  }
}

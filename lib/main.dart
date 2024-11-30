// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notes_app2/view/edit_note_view.dart';
import 'package:notes_app2/view/notes_view.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      routes: {
        NotesView.notesViewPath: (context) => const NotesView(),
        EditNoteView.editNoteViewPath: (context) => EditNoteView()
      },
      initialRoute: NotesView.notesViewPath,
    );
  }
}

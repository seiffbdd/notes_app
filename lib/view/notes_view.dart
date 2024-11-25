import 'package:flutter/material.dart';
import 'package:notes_app2/widgets/custom_app_bar.dart';
import 'package:notes_app2/widgets/notes_list_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 247, 255),
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0, bottom: 12.0),
        child: Column(
          children: [CustomAppBar(), Expanded(child: NotesListView())],
        ),
      ),
    );
  }
}

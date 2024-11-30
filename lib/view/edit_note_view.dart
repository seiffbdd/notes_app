import 'package:flutter/material.dart';
import 'package:notes_app2/widgets/custom_search_icon.dart';
import 'package:notes_app2/widgets/custom_text_field.dart';

class EditNoteView extends StatefulWidget {
  static const String editNoteViewPath = 'editNoteViewPath';

  const EditNoteView({super.key});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Note',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CustomIcon(icon: Icons.check),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: titleController,
              hintText: 'Title',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: contentController,
              hintText: 'Content',
              maxLines: 6,
            )
          ],
        ),
      ),
    );
  }
}

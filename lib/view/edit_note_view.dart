import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app2/cubits/get_notes_cubit/cubit/get_notes_cubit.dart';
import 'package:notes_app2/models/note_model.dart';
import 'package:notes_app2/widgets/custom_search_icon.dart';
import 'package:notes_app2/widgets/custom_text_field.dart';

class EditNoteView extends StatefulWidget {
  static const String editNoteViewPath = 'editNoteViewPath';

  final NoteModel? note;

  const EditNoteView({
    super.key,
    this.note,
  });

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.note?.title ?? 'title';
    contentController.text = widget.note?.content ?? 'content';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Note',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: GestureDetector(
                onTap: () {
                  widget.note!.title = titleController.text;
                  widget.note!.content = contentController.text;
                  widget.note!.save();
                  Navigator.pop(context);
                  BlocProvider.of<GetNotesCubit>(context).getNotes();
                },
                child: CustomIcon(icon: Icons.check)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              controller: titleController,
              hintText: 'Title',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
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

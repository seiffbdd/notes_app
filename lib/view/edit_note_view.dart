import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app2/cubits/get_notes_cubit/cubit/get_notes_cubit.dart';
import 'package:notes_app2/models/note_model.dart';
import 'package:notes_app2/widgets/custom_search_icon.dart';
import 'package:notes_app2/widgets/custom_text_field.dart';
import 'package:notes_app2/widgets/edit_note_colors_list.dart';

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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.note?.title ?? 'title';
    _contentController.text = widget.note?.content ?? 'content';
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
                  if (_formKey.currentState!.validate()) {
                    widget.note!.title = _titleController.text;
                    widget.note!.content = _contentController.text;
                    widget.note!.save();
                    Navigator.pop(context);
                    BlocProvider.of<GetNotesCubit>(context).getNotes();
                  }
                },
                child: CustomIcon(icon: Icons.check)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _titleController,
                  hintText: 'Title',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'title can\'t be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: _contentController,
                  hintText: 'Content',
                  maxLines: 6,
                  textInputAction: TextInputAction.newline,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 2 * 38,
                    child: EditNoteColorsList(
                      note: widget.note!,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

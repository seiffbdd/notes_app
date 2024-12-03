import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app2/cubits/add_notes_cubit/cubit/add_note_cubit.dart';
import 'package:notes_app2/cubits/get_notes_cubit/cubit/get_notes_cubit.dart';
import 'package:notes_app2/models/note_model.dart';
import 'package:notes_app2/widgets/colors_list_view.dart';
import 'package:notes_app2/widgets/custom_button.dart';
import 'package:notes_app2/widgets/custom_text_field.dart';

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.contentController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController contentController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(
              controller: titleController,
              hintText: 'Title',
              autoFocus: true,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Field can\'t be empty';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: contentController,
              hintText: 'Content',
              maxLines: 5,
              textInputAction: TextInputAction.newline,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(height: 2 * 34, child: ColorsListView()),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              buttonText: 'Add',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  AddNoteCubit.get(context).addNote(NoteModel(
                      title: titleController.text,
                      content: contentController.text,
                      date: DateTime.now().toString(),
                      color: Colors.blue.value));

                  BlocProvider.of<GetNotesCubit>(context).getNotes();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app2/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
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
            controller: titleController,
            hintText: 'Content',
            maxLines: 5,
            textInputAction: TextInputAction.newline,
          )
        ],
      ),
    );
  }
}

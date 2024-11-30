import 'package:flutter/material.dart';
import 'package:notes_app2/widgets/custom_button.dart';
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
      padding: EdgeInsets.only(
          top: 24.0,
          right: 16.0,
          left: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
              maxLines: 5,
              textInputAction: TextInputAction.newline,
            ),
            const SizedBox(
              height: 60,
            ),
            CustomButton(
              buttonText: 'Add',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

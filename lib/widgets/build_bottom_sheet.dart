import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app2/cubits/cubit/add_note_cubit.dart';
import 'package:notes_app2/widgets/add_note_form.dart';

class BuildBottomSheet extends StatefulWidget {
  const BuildBottomSheet({super.key});

  @override
  State<BuildBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<BuildBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 24.0,
          right: 16.0,
          left: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFairlure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('failed to add note')));
          }
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading ? true : false,
            child: AddNoteForm(
                formKey: formKey,
                titleController: titleController,
                contentController: contentController),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app2/cubits/get_notes_cubit/cubit/get_notes_cubit.dart';
import 'package:notes_app2/widgets/build_bottom_sheet.dart';
import 'package:notes_app2/widgets/custom_app_bar.dart';
import 'package:notes_app2/widgets/notes_list_view.dart';

class NotesView extends StatefulWidget {
  static const String notesViewPath = 'notesViewPath';
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetNotesCubit>(context).getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const BuildBottomSheet();
              });
        },
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 247, 255),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          children: [
            CustomAppBar(
              icon: Icons.search,
              title: 'Notes',
            ),
            Expanded(child: NotesListView())
          ],
        ),
      ),
    );
  }
}

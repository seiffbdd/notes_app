import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app2/cubits/get_notes_cubit/cubit/get_notes_cubit.dart';
import 'package:notes_app2/models/note_model.dart';
import 'package:notes_app2/view/edit_note_view.dart';
import 'package:notes_app2/widgets/note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<GetNotesCubit>(context).notes;
        return ListView.separated(
          itemCount: notes.length,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditNoteView(
                              note: notes[index],
                            )));
              },
              child: NoteCard(
                note: notes[index],
              ),
            );
          },
        );
      },
    );
  }
}

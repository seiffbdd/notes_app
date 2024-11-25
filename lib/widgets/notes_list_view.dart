import 'package:flutter/material.dart';
import 'package:notes_app2/widgets/note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        return const NoteCard();
      },
    );
  }
}

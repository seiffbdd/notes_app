import 'package:flutter/material.dart';
import 'package:notes_app2/constants.dart';
import 'package:notes_app2/models/note_model.dart';
import 'package:notes_app2/widgets/colors_list_view.dart';
import 'package:notes_app2/widgets/custom_circle_avatar.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int pickedColor;
  @override
  void initState() {
    super.initState();
    pickedColor = colors.indexOf(Color(widget.note.color!));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  pickedColor = index;
                  widget.note.color = colors[pickedColor].value;
                });
              },
              child: CustomCircleAvatar(
                  isPicked: pickedColor == index, color: colors[index]),
            ));
      },
    );
    ;
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app2/models/note_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
          color: Color(note.color), borderRadius: BorderRadius.circular(20)),
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          ListTile(
            title: Text(
              note.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              note.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: Colors.black.withOpacity(.7), fontSize: 20),
            ),
            trailing: Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 30,
                    )),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                note.date.substring(0, 10),
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes_page_assignment/utils/delete_note.dart';
import 'package:notes_page_assignment/utils/delete_note_android.dart';
import 'package:notes_page_assignment/utils/edit_note.dart';
import 'package:notes_page_assignment/utils/edit_note_android.dart';

class NoteEntity {
  final String title;
  final String description;

  NoteEntity({
    required this.title,
    required this.description,
  });
}

class Note extends StatefulWidget {
  final NoteEntity note;
  final void Function(NoteEntity note)? delete;
  final void Function(NoteEntity note, String title, String description)? edit;

  const Note({
    super.key,
    required this.note,
    this.delete,
    this.edit,
  });

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  final Color randomColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            // spreadRadius: 1,
            blurRadius: 230,
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: Card(
        color: randomColor.withOpacity(0.75),
        child: ListTile(
          title: Text(
            widget.note.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          subtitle: Text(widget.note.description),
          leading: const Icon(Icons.notes),
          minTileHeight: 100,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => isIos
                        ? EditNote(
                            note: widget.note,
                            edit: widget.edit,
                          )
                        : EditNoteAndroid(
                            note: widget.note,
                            edit: widget.edit,
                          ),
                  );
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => isIos
                        ? DeleteNote(
                            note: widget.note,
                            deleteNote: widget.delete,
                          )
                        : DeleteNoteAndroid(
                            note: widget.note,
                            deleteNote: widget.delete,
                          ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

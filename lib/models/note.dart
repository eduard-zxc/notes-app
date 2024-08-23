import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notes_page_assignment/utils/delete_note.dart';
import 'package:notes_page_assignment/utils/edit_note.dart';

class Note extends StatefulWidget {
  final String? title;
  final String? description;
  final List<Note>? noteList;
  final void Function()? delete;
  final int? index;
  const Note(
      {super.key,
      this.title,
      this.description,
      this.noteList,
      this.delete,
      this.index});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  final Color randomColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 20,
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: Card(
        color: randomColor.withOpacity(0.75),
        child: ListTile(
          title: Text(
            widget.title.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          subtitle: Text(widget.description.toString()),
          leading: const Icon(Icons.notes),
          minTileHeight: 100,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => const EditNote(),
                  );
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => DeleteNote(
                        noteList: widget.noteList,
                        index: widget.noteList![widget.index!.toInt()],
                        deleteNote: widget.delete),
                  );
                },
                icon: const Icon(Icons.delete),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_page_assignment/models/note.dart';

class DeleteNote extends StatelessWidget {
  final NoteEntity note;
  final void Function(NoteEntity note)? deleteNote;

  const DeleteNote({
    super.key,
    required this.note,
    required this.deleteNote,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Delete note'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: [
            Text('Are you sure you want to delete this note?'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: CupertinoColors.activeBlue),
          ),
        ),
        TextButton(
          onPressed: () {
            deleteNote?.call(note);
            Navigator.of(context).pop();
          },
          child: const Text(
            'Delete',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

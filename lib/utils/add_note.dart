import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_page_assignment/models/note.dart';

class AddNote extends StatefulWidget {
  final String? title;
  final String? description;
  final List<Note>? noteList;

  const AddNote({super.key, this.title, this.description, this.noteList});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Create a new note'),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    maxLength: 30,
                    placeholder: 'Enter title',
                    placeholderStyle: const TextStyle(color: Colors.grey),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    // textInputAction: TextInputAction.next,
                    onSubmitted: (value) => widget.title,
                  ),
                  const SizedBox(height: 10),
                  CupertinoTextField(
                    maxLength: 200,
                    maxLines: 5,
                    placeholder: 'Enter description',
                    placeholderStyle: const TextStyle(color: Colors.grey),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    onSubmitted: (value) => widget.description,
                  ),
                ],
              ),
            ),
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
        // ignore: prefer_const_constructors
        TextButton(
          onPressed: () {
            setState(() {
              widget.noteList!.add(
                Note(title: widget.title, description: widget.description),
              );
            });
            Navigator.of(context).pop();
          },
          child: const Text(
            'Add',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: CupertinoColors.activeBlue),
          ),
        )
      ],
    );
  }
}

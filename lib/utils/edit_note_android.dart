import 'package:flutter/material.dart';
import 'package:notes_page_assignment/models/note.dart';

class EditNoteAndroid extends StatefulWidget {
  final void Function(NoteEntity note, String title, String description)? edit;
  final NoteEntity note;

  const EditNoteAndroid({
    super.key,
    this.edit,
    required this.note,
  });

  @override
  State<EditNoteAndroid> createState() => _EditNoteAndroidState();
}

class _EditNoteAndroidState extends State<EditNoteAndroid> {
  late final TextEditingController titleController = TextEditingController()
    ..text = widget.note.title;

  late final TextEditingController descriptionController =
      TextEditingController()..text = widget.note.description;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit note'),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    maxLength: 30,
                    decoration: const InputDecoration(hintText: 'Edit title'),
                    controller: titleController,
                    validator: (value) =>
                        value!.isEmpty ? 'This field is required' : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    maxLength: 200,
                    maxLines: 5,
                    decoration:
                        const InputDecoration(hintText: 'Edit description'),
                    controller: descriptionController,
                    validator: (value) =>
                        value!.isEmpty ? 'This field is required' : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
              ),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.edit?.call(widget.note, titleController.text,
                      descriptionController.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text(
                'Save',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        // ignore: prefer_const_constructors
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_page_assignment/models/note.dart';

class EditNote extends StatefulWidget {
  final void Function(NoteEntity note, String title, String description)? edit;
  final NoteEntity note;

  const EditNote({
    super.key,
    this.edit,
    required this.note,
  });

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late final TextEditingController titleController = TextEditingController()
    ..text = widget.note.title;
  late final TextEditingController descriptionController =
      TextEditingController()..text = widget.note.description;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Edit note'),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  CupertinoTextFormFieldRow(
                    maxLength: 30,
                    padding: const EdgeInsets.all(0),
                    placeholder: 'Enter title',
                    placeholderStyle: const TextStyle(color: Colors.grey),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    controller: titleController,
                    validator: (value) =>
                        value!.isEmpty ? 'This field is required' : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 10),
                  CupertinoTextFormFieldRow(
                    maxLength: 200,
                    padding: const EdgeInsets.all(0),
                    maxLines: 5,
                    placeholder: 'Enter description',
                    placeholderStyle: const TextStyle(color: Colors.grey),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
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
            if (_formKey.currentState!.validate()) {
              widget.edit?.call(widget.note, titleController.text,
                  descriptionController.text);
              Navigator.of(context).pop();
            }
          },
          child: const Text(
            'Save',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: CupertinoColors.activeBlue),
          ),
        ),
      ],
    );
  }
}

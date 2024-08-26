import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNoteAndroid extends StatelessWidget {
  final void Function(String title, String description)? add;

  AddNoteAndroid({super.key, this.add});

  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();

  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create new note'),
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
                    decoration: const InputDecoration(hintText: 'Enter title'),
                    controller: _titleController,
                    validator: (value) =>
                        value!.isEmpty ? 'This field is required' : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    maxLength: 200,
                    maxLines: 5,
                    decoration:
                        const InputDecoration(hintText: 'Enter description'),
                    controller: _descriptionController,
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
                  add?.call(_titleController.text, _descriptionController.text);
                  Navigator.of(context).pop();
                }
                // print(widget.title);
                // print(widget.description);
              },
              child: const Text(
                'Add',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

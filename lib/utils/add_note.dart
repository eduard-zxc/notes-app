import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  final void Function(String title, String description)? add;

  AddNote({super.key, this.add});

  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();

  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Create new note'),
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
                    controller: _titleController,
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
            if (_formKey.currentState!.validate()) {
              add?.call(_titleController.text, _descriptionController.text);
              Navigator.of(context).pop();
            }
            // print(widget.title);
            // print(widget.description);
          },
          child: const Text(
            'Add',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: CupertinoColors.activeBlue),
          ),
        ),
      ],
    );
  }
}

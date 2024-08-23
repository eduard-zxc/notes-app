import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Edit note'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: [
            Text('To implement'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Press'),
        ),
      ],
    );
  }
}

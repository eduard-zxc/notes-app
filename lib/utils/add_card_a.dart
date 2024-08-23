import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosAlert extends StatelessWidget {
  const IosAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add note'),
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

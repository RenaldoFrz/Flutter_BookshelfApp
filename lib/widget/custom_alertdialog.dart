import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String desc;
  final VoidCallback onYesPressed;
  const CustomAlertDialog(
      {required this.title,
      required this.desc,
      required this.onYesPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        height: 60,
        width: 100,
        child: Text(desc),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: onYesPressed,
        ),
      ],
    );
  }
}

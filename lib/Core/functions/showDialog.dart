
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
Future<bool?> showAlertDialog(BuildContext context, String title, String content) async {
  // Your existing dialog code
  // ...

  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed: () {
              Navigator.pop(context, true); // Pass true when "Yes" is pressed
            },
            child: const Text('Yes'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () {
              Navigator.pop(context, false); // Pass false when "No" is pressed
            },
            child: const Text('No'),
          ),
        ],
      );
    },
  );
}
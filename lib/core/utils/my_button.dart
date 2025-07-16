import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed, child: Text(text), 
      color: Colors.amber,
      textColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(16),
    );
  }
}

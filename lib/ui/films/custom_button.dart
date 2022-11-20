

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(double.infinity, 100),
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.all(15)
      ),
      onPressed: onTap,
      child: Text(text),
    );
  }
}
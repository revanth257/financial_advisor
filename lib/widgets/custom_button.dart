import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1A237E),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
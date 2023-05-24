import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({Key? key, required this.number, required this.text})
      : super(key: key);

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            text,
          ),
        ],
      ),
    );
  }
}

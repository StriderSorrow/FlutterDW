import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({Key? key, required this.number, required this.text, required this.func})
      : super(key: key);

  final Function func;
  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Column(
        children: [
          Text(
            number.toString(),
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

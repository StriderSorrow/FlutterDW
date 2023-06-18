import 'package:flutter/material.dart';
import 'package:dw_front/resources/app_colors.dart';

class StriderButton extends StatelessWidget {
  const StriderButton({Key? key, required this.text, required this.func})
      : super(key: key);
  final String text;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        func();
      },
      style: ButtonStyle(
        side: MaterialStateProperty.all(
            const BorderSide(width: 2, color: AppColors.borderColor)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 14),
        child: Text(text,
            style: const TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 20,
                fontFamily: "Bookman Old Style",
                fontWeight: FontWeight.normal)),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomRichTextField extends StatelessWidget {
  const CustomRichTextField(
      {Key? key,
      required this.textController,
      required this.hint})
      : super(key: key);

  final TextEditingController textController;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      // return SingleChildScrollView(
      //   child: Container(
      //     padding: const EdgeInsets.all(16.0),
      //     child: TextField(
      //       maxLines: 3,
      //       decoration: InputDecoration(
      //         hintText: hint,
      //       ),
      //     ),
      //   ),
      // );
      return SingleChildScrollView(
        child: TextField(
          maxLines: 5,
          decoration: InputDecoration(
            label: Text(
        hint,
        style: const TextStyle(color: Colors.black, fontFamily: "Bookman Old Style"),
            ),
            border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        borderRadius: BorderRadius.circular(10),
            ),
          ),
          controller: textController,
          style: const TextStyle(color: Colors.black),
        ));
    });
  }
}

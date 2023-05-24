import 'package:flutter/material.dart';

class StriderDivider extends StatelessWidget {
  const StriderDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.black,
      height: 20,
      thickness: 1.5,
    );
  }
}

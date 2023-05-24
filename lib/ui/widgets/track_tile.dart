import 'package:flutter/material.dart';

class TrackTile extends StatelessWidget {
  const TrackTile({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0), //or 15.0
          child: Container(
            height: 70.0,
            width: 70.0,
            color: const Color(0xffFF0E58),
            child: const Icon(Icons.volume_up, color: Colors.white, size: 50.0),
          ),
        ),
        Column(
          children: [
            Text("Title"),

          ],
        )
      ],
    );
  }
}

// ignore: file_names
import 'package:flutter/material.dart';

class AddDesc extends StatelessWidget {
  const AddDesc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '  description',
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: 366,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(238, 226, 218, 218),
          ),
          child: const TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class AddName extends StatelessWidget {
  const AddName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "  name",
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: 366,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color.fromARGB(238, 226, 218, 218),
          ),
        ),
      ],
    );
  }
}


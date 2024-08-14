// ignore: file_names
import 'package:flutter/material.dart';

class AddPrice extends StatelessWidget {
  const AddPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '  price',
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: 366,
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(238, 226, 218, 218),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              suffixIcon: const Icon(Icons.attach_money, color: Colors.grey),
            ),
          ),
        )
      ],
    );
  }
}

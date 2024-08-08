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
          "  price",
          style: TextStyle(
              fontFamily: "Poppins", fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 366,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color.fromARGB(238, 226, 218, 218),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8, right: 4),
              child: Text(
                "\$",
                style: TextStyle(fontFamily: "Poppins", fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

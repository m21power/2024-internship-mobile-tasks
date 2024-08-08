import 'package:flutter/material.dart';

Widget Size(int num) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 3,
      color: Colors.white,
      child: Container(
        width: 50,
        child: Center(
          child: Text(
            "$num",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ),
  );
}

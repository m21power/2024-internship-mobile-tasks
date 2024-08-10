// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ImageUploader extends StatelessWidget {
  const ImageUploader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 190,
        width: 366,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(238, 226, 218, 218),
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Icon(
                Icons.image_outlined,
                size: 48,
              ),
              Text(
                'upload image',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

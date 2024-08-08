import 'package:flutter/material.dart';
import 'package:myfirst_app/Update/AddDescr.dart';
import 'ImageUploader_.dart';
import 'AddName_.dart';
import 'AddPrice_.dart';

class updatepage extends StatelessWidget {
  const updatepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Add Product ",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.chevron_left,
            color: Color.fromARGB(255, 24, 96, 239),
          ),
        ),

        // where image uploaded
        body: Column(
          children: [
            ImageUploader(),
            const SizedBox(
              height: 10,
            ),
            // for name
            AddName(),
            // for price
            const SizedBox(
              height: 10,
            ),
            AddPrice(),
            const SizedBox(height: 10),
            const AddDesc(),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 366,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "ADD",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 366,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "DELETE",
                  style: TextStyle(
                      color: Colors.red,
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

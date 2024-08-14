// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../widgets/details_page_widgets/Item_description.dart';
import '../../widgets/details_page_widgets/update_delete_button.dart';

class Detail extends StatelessWidget {
  //const Detail({super.key});
  final List _sizes = [39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50];
  final String _text =
      'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe';

  Detail({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: UpdateDeleteButton(),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/shoe.jpeg',
                  fit: BoxFit.fitHeight,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(''),
                          ),
                          Icon(
                            Icons.chevron_left,
                            color: Color.fromARGB(255, 44, 83, 222),
                          )
                        ]),
                  ),
                ),
              ],
            ),
            ItemDescription(text: _text, sizes: _sizes),
          ],
        ),
      ),
    );
  }
}

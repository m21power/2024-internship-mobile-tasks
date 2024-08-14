import 'package:flutter/material.dart';
import 'sizeofshoe.dart';

class ItemDescription extends StatelessWidget {
  final String text;
  final List sizes;
  const ItemDescription({required this.text, required this.sizes});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          const ListTile(
            dense: true,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Text('(4.0)'),
              ],
            ),
            leading: Text(
              "Men's shoe",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
          ),
          const ListTile(
            dense: true,
            title: Text(
              'Derby Leather',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            ),
            trailing: Text(
              '\$120',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sizes.length,
                itemBuilder: (context, index) {
                  return SizeOfShoe(num: sizes[index]);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: Text(
                text,
                style: const TextStyle(
                    color: Color.fromARGB(182, 28, 28, 28),
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

// group widget
Widget group() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
    child: Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: Image.asset(
              'assets/shoe.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          const ListTile(
            dense: true,
            title: Text(
              'Derby Leather Shoes',
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
        ],
      ),
    ),
  );
}

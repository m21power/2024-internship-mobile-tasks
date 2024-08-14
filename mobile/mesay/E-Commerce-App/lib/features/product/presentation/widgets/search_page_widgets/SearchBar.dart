import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 48,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 239, 230, 230),
                  ),
                ),
                hintText: 'Leather',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 211, 206, 206),
                ),
                suffixIcon: IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.arrow_forward,
                      color: Color.fromARGB(255, 20, 89, 239)),
                )),
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 20, 89, 239),
          ),
          child: IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

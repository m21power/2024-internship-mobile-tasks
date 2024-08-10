import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              width: 311,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 231, 224, 224)),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  "Leather",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Color.fromARGB(255, 20, 89, 239)
            )
          ],
        ),
        const SizedBox(
          width: 7,
        ),
        Container(
          width: 48,
          height: 48,
          child: Icon(
            Icons.filter_list,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(255, 20, 89, 239),
          ),
        )
      ],
    );
  }
}

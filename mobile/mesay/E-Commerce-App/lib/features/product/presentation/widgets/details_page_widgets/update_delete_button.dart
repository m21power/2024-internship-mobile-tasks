import 'package:flutter/material.dart';

class UpdateDeleteButton extends StatelessWidget {
  const UpdateDeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            height: 50,
            width: 152,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'DELETE',
                style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(
            width: 62,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
            ),
            height: 50,
            width: 152,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/update');
              },
              child: const Text(
                'UPDATE',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}

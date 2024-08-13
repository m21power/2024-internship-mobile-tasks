import 'package:flutter/material.dart';

class SizeOfShoe extends StatelessWidget {
  final int num;
  const SizeOfShoe({required this.num});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => {},
        child: Text('$num'),
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(5),
          backgroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}

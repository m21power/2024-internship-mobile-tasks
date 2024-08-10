import 'package:flutter/material.dart';

class Slider extends StatefulWidget {
  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  RangeValues _values = RangeValues(1000, 20000);
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
        values: _values,
        onChanged: (newValues) {
          setState(() {
            _values = newValues;
          });
        });
  }
}

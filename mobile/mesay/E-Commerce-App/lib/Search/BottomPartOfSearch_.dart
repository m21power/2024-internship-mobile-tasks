import 'package:flutter/material.dart';

class BottomPartOfSearch extends StatefulWidget {
  @override
  State<BottomPartOfSearch> createState() => _BottomPartOfSearchState();
}

class _BottomPartOfSearchState extends State<BottomPartOfSearch> {
  RangeValues _values = const RangeValues(1000, 20000);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 32, top: 8),
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Category"),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 366,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 239, 230, 230)),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("Price"),
                  const SizedBox(
                    height: 5,
                  ),
                  RangeSlider(
                    activeColor: const Color.fromARGB(255, 20, 89, 239),
                    values: _values,
                    min: 1000,
                    max: 20000,
                    divisions: 100,
                    labels: RangeLabels(
                      '${_values.start.round()}',
                      '${_values.end.round()}',
                    ),
                    onChanged: (newValues) {
                      setState(() {
                        _values = newValues;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 366,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 239, 230, 230)),
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 20, 89, 239),
                    ),
                    child: TextButton(
                      child: const Text(
                        "APPLY",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

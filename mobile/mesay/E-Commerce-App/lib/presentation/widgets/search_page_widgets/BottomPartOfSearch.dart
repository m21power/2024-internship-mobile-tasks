import 'package:flutter/material.dart';

class BottomPartOfSearch extends StatefulWidget {
  const BottomPartOfSearch({super.key});

  @override
  State<BottomPartOfSearch> createState() => _BottomPartOfSearchState();
}

class _BottomPartOfSearchState extends State<BottomPartOfSearch> {
  RangeValues _values = const RangeValues(1000, 20000);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, top: 8),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text('Category'),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 239, 230, 230),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Price'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 32, bottom: 10),
                    child: Container(
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
                          'APPLY',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

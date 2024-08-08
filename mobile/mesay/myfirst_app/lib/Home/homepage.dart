import 'package:flutter/material.dart';
import 'Group.dart';
import 'header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              header(),
              Expanded(
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return group();
                    }),
              )
            ],
          ),
          floatingActionButton: Container(
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            width: 72,
            height: 72,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}

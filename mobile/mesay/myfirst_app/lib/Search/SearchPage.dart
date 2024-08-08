import 'package:flutter/material.dart';
import 'package:myfirst_app/Home/Group.dart';
import 'SearchBar_.dart';
import 'BottomPartOfSearch_.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Search Product ",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.chevron_left,
            color: Color.fromARGB(255, 20, 89, 239),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // for search bar
            Searchbar(),
            SizedBox(
              height: 36,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return group();
                      },
                    ),
                  ),
                  // for category section
                ],
              ),
            ),
            BottomPartOfSearch()
          ],
        ),
      ),
    );
  }
}

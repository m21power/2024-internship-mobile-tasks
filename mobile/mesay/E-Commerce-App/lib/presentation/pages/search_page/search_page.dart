import 'package:flutter/material.dart';
import '../../widgets/home_page_widgets/group.dart';

import '../../widgets/search_page_widgets/BottomPartOfSearch.dart';
import '../../widgets/search_page_widgets/SearchBar.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Search Product ',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.chevron_left,
              color: Color.fromARGB(255, 20, 89, 239),
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // for search bar
            const Searchbar(),
            const SizedBox(
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
                        return const Group();
                      },
                    ),
                  ),
                  // for category section
                ],
              ),
            ),
            const BottomPartOfSearch()
          ],
        ),
      ),
    );
  }
}

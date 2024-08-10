import 'package:flutter/material.dart';
import 'Detail/DetailsPage.dart';
import 'Home/homepage.dart';

import 'Search/SearchPage.dart';
import 'Update/UpdatePage.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) => Detail(),
        '/search': (context) => const Searchpage(),
        '/update': (context) => const UpdatePage(),
      },
    ),
  );
}

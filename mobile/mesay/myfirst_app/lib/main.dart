import 'package:flutter/material.dart';
import 'package:myfirst_app/Detail/DetailsPage.dart';
import 'package:myfirst_app/Home/homepage.dart';
import 'package:myfirst_app/Update/UpdatePage.dart';
import 'Search/SearchPage.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) => Detail(),
        '/search': (context) => Searchpage(),
        '/update': (context) => updatepage(),
      },
    ),
  );
}

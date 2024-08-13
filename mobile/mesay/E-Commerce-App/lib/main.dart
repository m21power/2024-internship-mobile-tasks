import 'package:flutter/material.dart';

import 'presentation/pages/details_page/detail_page.dart';
import 'presentation/pages/home_page/Home_Page.dart';
import 'presentation/pages/search_page/search_page.dart';
import 'presentation/pages/update_page/Update_Page.dart';

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

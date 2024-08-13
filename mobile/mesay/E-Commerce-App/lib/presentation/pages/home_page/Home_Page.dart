import 'package:flutter/material.dart';

import '../../widgets/home_page_widgets/FloatingActionButton_.dart';
import '../../widgets/home_page_widgets/group.dart';
import '../../widgets/home_page_widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Header(),
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/detail'),
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const Group();
                    }),
              ),
            )
          ],
        ),
        floatingActionButton: const BottomButton(),
      ),
    );
  }
}

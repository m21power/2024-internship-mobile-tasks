import 'package:flutter/material.dart';
import '../Update/UpdatePage.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            header(context),
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/detail'),
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return group();
                    }),
              ),
            )
          ],
        ),
        floatingActionButton: Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          width: 72,
          height: 72,
          child: Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = const Offset(1.0, 0.0);
                      var end = Offset.zero;
                      var curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const UpdatePage();
                    },
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

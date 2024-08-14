import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 130,
        //color: Colors.white,
        child: Column(
          children: [
            ListTile(
              title: const Text(
                'July 14, 2024',
                style: TextStyle(
                    color: Color.fromRGBO(31, 31, 29, 0.322),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Syne'),
              ),
              subtitle: const Row(
                children: [
                  Text(
                    'Hello, ',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  Text(
                    'Mesay',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ],
              ),
              trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      border: const Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(250, 228, 219, 219)),
                          top: BorderSide(
                              color: Color.fromARGB(250, 228, 219, 219)),
                          left: BorderSide(
                              color: Color.fromARGB(250, 228, 219, 219)),
                          right: BorderSide(
                              color: Color.fromARGB(250, 228, 219, 219))),
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white),
                  child: const Icon(Icons.notifications_none_outlined)),
              leading: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: const Color.fromARGB(202, 209, 202, 202)),
                width: 50,
                height: 50,
              ),
            ),
            ListTile(
              trailing: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border: const Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(250, 228, 219, 219)),
                        top: BorderSide(
                            color: Color.fromARGB(250, 228, 219, 219)),
                        left: BorderSide(
                            color: Color.fromARGB(250, 228, 219, 219)),
                        right: BorderSide(
                            color: Color.fromARGB(250, 228, 219, 219))),
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.white),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/search');
                      },
                      icon: const Icon(
                        Icons.search_outlined,
                        weight: 1,
                        size: 24,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              title: const Text(
                'Available Products',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
          backgroundColor: Colors.blueGrey,
          activeColor: Colors.white,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          currentIndex: pageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.upload,
                  size: 30,
                ),
                label: 'Upload'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag,
                  size: 30,
                ),
                label: 'Cart'),
          ]),
    );
  }
}

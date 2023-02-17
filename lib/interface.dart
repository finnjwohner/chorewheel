import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';
import 'chorePage.dart';
import 'wishlistPage.dart';
import 'leaderboardPage.dart';

class Interface extends StatefulWidget {
  const Interface({super.key});

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  int pageIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) => setState(() {
              pageIndex = value;
            }),
            children: const [
              HomePage(),
              ChorePage(),
              WishlistPage(),
              LeaderboardPage(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(pageIndex == 0 ? CupertinoIcons.house_fill : CupertinoIcons.house, size: 40),
                      Icon(pageIndex == 1 ? CupertinoIcons.hexagon_fill : CupertinoIcons.hexagon, size: 40),
                      Icon(pageIndex == 2 ? CupertinoIcons.cube_box_fill : CupertinoIcons.cube_box, size: 40),
                      Icon(pageIndex == 3 ? CupertinoIcons.heart_fill : CupertinoIcons.heart, size: 40),
                    ],
                  ),
                )
              ),
          ),
        ],
      ),
    );
  }
}
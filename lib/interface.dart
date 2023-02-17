import 'package:flutter/material.dart';
import 'homePage.dart';
import 'chorePage.dart';
import 'wishlistPage.dart';
import 'leaderboardPage.dart';

class Interface extends StatelessWidget {
  const Interface({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
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
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
              ),
          ),
        ],
      ),
    );
  }
}
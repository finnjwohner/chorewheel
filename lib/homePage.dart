import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.yellow,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Chores", style: Theme.of(context).textTheme.headline4),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  )
                ],
              ),
            )
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.yellow,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Leaderboard", style: Theme.of(context).textTheme.headline4),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  )
                ],
              ),
            )
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.yellow,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Wishlist", style: Theme.of(context).textTheme.headline4),
                      const Icon(Icons.arrow_forward_ios),
                    ],
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

typedef CardTapCallback = Function(int);

class HomePage extends StatelessWidget {
  const HomePage({required this.cardTapCallback, super.key});

  final CardTapCallback cardTapCallback;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => cardTapCallback(1),
            child: Container(
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
          ),
          GestureDetector(
            onTap: () => cardTapCallback(3),
            child: Container(
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
          ),
          GestureDetector(
            onTap: () => cardTapCallback(2),
            child: Container(
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
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12.5),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text("Away")
                  ),
                ),
                Container(
                  height: 50,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12.5),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text("Settings")
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
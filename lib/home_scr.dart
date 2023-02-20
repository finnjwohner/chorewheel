import 'package:flutter/material.dart';

typedef CardTapCallback = Function(int);

class HomePage extends StatelessWidget {
  const HomePage({required this.cardTapCallback, super.key});

  final CardTapCallback cardTapCallback;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () => cardTapCallback(1),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              //height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.yellow,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Chores", style: Theme.of(context).textTheme.headline4),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Your next chore"),
                    ),
                    Text("Mop the bathroom floor", style: Theme.of(context).textTheme.titleLarge)
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
              //height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.yellow,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Leaderboard", style: Theme.of(context).textTheme.headline4),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1631885628726-d60689c330db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1970&q=80'),
                            backgroundColor: Colors.brown.shade800,
                            //child: const Text('JP'),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("You are in 4th place"),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
                            backgroundColor: Colors.brown.shade800,
                            //child: const Text('JP'),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Jacob is third, beating you by just 2 points"),
                          ),
                        ],
                      ),
                    ),
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.yellow,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Wishlist", style: Theme.of(context).textTheme.headline4),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Thomas wants Loo Roll"),
                    ),
                    Text("\"PLEASE I NEED IT\"", style: Theme.of(context).textTheme.titleLarge)
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
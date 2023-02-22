import 'package:chorewheel/create_flat_scr.dart';
import 'package:flutter/material.dart';
import 'join_flat_options_scr.dart';
import 'create_account_scr.dart';

class IntroScr extends StatelessWidget {
  const IntroScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Welcome to Chorewheel, let's get you setup"),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JoinFlatOptionsScr())),
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll<Color>(Colors.yellowAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    child: Text("Join Flat", style: Theme.of(context).textTheme.labelLarge,),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateFlatScr())),
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll<Color>(Color.fromRGBO(235, 235, 235, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    child: Text("Create Flat", style: Theme.of(context).textTheme.labelLarge,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
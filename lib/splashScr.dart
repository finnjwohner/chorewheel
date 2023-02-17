import 'package:chorewheel/createAccountScr.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Text(
                "Chorewheel",
                style: Theme.of(context).textTheme.displayMedium
              ),
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 100),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Login"),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Username",
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Password",
                            ),
                          ),
                          
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              child: Text("Login",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              onPressed: null,
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll<Color>(Colors.yellowAccent),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              child: Text("Create Account",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAccountScreen())),
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll<Color>(Color.fromRGBO(235, 235, 235, 1)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:chorewheel/createAccountScr.dart';
import 'package:flutter/material.dart';
import 'Functions/Requests.dart';
import 'package:http/http.dart' as http;
import 'interface.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final usernameCon = TextEditingController();
  final passwordCon = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  String errorMessage = "";

  void login(String username, String password) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    NavigatorState navState = Navigator.of(context);
    http.Response res = await Request.login(username, password);
    navState.pop();
    if(res.statusCode == 200) {
      navState.pop();
      navState.push(MaterialPageRoute(builder: (context) => const Interface()));
    }
    else {
      setState(() {
        errorMessage = res.body;
      });
    }

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 100),
              child: Text(
                "Chorewheel",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                      width: 300,
                      child: Form(
                        key: loginKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: Text(errorMessage),
                            ),
                            const Text("Login"),
                            TextFormField(
                              validator: (value)  {
                                if (value == null || value.isEmpty) {
                                  return 'Missing Username';
                                }
                                else if (value.length > 30 || value.length < 6) {
                                  return 'Username must be 6 to 30 characters long';
                                }
                                return null;
                              },
                              controller: usernameCon,
                              decoration: const InputDecoration(
                                hintText: "Username",
                              ),
                            ),
                            TextFormField(
                              validator: (value)  {
                                if (value == null || value.isEmpty) {
                                  return 'Missing Password';
                                }
                                else if (value.length < 8) {
                                  return 'Password must be 8 or more characters long';
                                }
                                return null;
                              },
                              controller: passwordCon,
                              decoration: const InputDecoration(
                                hintText: "Password",
                              ),
                            ),
                            
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (loginKey.currentState!.validate()) {
                                    login(usernameCon.text, passwordCon.text);
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: const MaterialStatePropertyAll<Color>(Colors.yellowAccent),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                ),
                                child: Text("Login",
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAccountScreen())),
                                style: ButtonStyle(
                                  backgroundColor: const MaterialStatePropertyAll<Color>(Color.fromRGBO(235, 235, 235, 1)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                ),
                                child: Text("Create Account",
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ),
                          ],
                        ),
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
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'functions/requests.dart';
import 'interface.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final usernameCon = TextEditingController();
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();
  final conPasswordCon = TextEditingController();
  final createFormKey = GlobalKey<FormState>();

  String errorMessage = "";
  bool loading = false;
  bool isEnabled = true;

  @override void initState() {
    super.initState();
    isEnabled = true;
  }

  @override
  void deactivate() {
    super.deactivate();
    isEnabled = false;
  }

  void createAccount(String username, String email, String password) async {
    setState(() {
      loading = true;
    });

    NavigatorState navState = Navigator.of(context);
    http.Response res = await Request.register(username, password, email);
    if(res.statusCode == 200) {
      res = await Request.login(username, password);
      if(res.statusCode == 200) {
        setState(() {
          loading = false;
        });
        navState.pop();
        navState.push(MaterialPageRoute(builder: (context) => const Interface()));
        return;
      }
    }

    setState(() {
      loading = false;
      errorMessage = res.body;
    });
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
                style: Theme.of(context).textTheme.displayMedium
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                      width: 300,
                      child: Form(
                        key: createFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(bottom: 30),
                                child: Text(errorMessage),
                              ),
                            const Text("Create Account"),
                            TextFormField(
                              controller: usernameCon,
                              enabled: isEnabled,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Missing Username';
                                }
                                else if (value.length > 30 || value.length < 3) {
                                  return 'Username must be 3 to 30 characters long';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "Username",
                              ),
                            ),
                            TextFormField(
                              controller: emailCon,
                              enabled: isEnabled,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Missing email';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "Email",
                              ),
                            ),
                            TextFormField(
                              controller: passwordCon,
                              enabled: isEnabled,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Missing password';
                                }
                                else if (value.length < 8) {
                                  return 'Password must be 8 or more characters long';
                                }
                                else if (value != conPasswordCon.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "Password",
                              ),
                            ),
                            TextFormField(
                              controller: conPasswordCon,
                              enabled: isEnabled,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Missing password confirmation';
                                }
                                else if (passwordCon.text.isEmpty) {
                                  return null;
                                }
                                else if (passwordCon.text.length < 8) {
                                  return null;
                                }
                                else if (value != conPasswordCon.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "Confirm Password",
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (createFormKey.currentState!.validate()) {
                                    createAccount(usernameCon.text, emailCon.text, passwordCon.text);
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
                                child: loading ? const CircularProgressIndicator(color: Colors.black,) : Text("Create Account", style: Theme.of(context).textTheme.labelLarge,),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                style: ButtonStyle(
                                  backgroundColor: const MaterialStatePropertyAll<Color>(Color.fromRGBO(235, 235, 235, 1)),
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
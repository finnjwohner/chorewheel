import 'package:flutter/material.dart';
import 'splash_scr.dart';
import 'functions/storage.dart';
import 'functions/requests.dart';
import 'interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> autoLogin() async {

    String? sessionToken = await Storage.read('sessionToken');
    if (sessionToken != null) {
      return await Request.checkSessionToken(sessionToken);
    }

    return false;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chorewheel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: autoLogin(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            if (snapshot.data == true) {
              return const Interface();
            } else {
              return const SplashScreen();
            }
          } else {
            return Expanded(child: Container(color: Colors.white));
          }
        } 
      )
    );
  }
}
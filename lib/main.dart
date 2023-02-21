import 'package:flutter/material.dart';
import 'splash_scr.dart';
import 'functions/storage.dart';
import 'functions/requests.dart';
import 'interface.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> autoLogin() async {

    String? sessionToken = await Storage.read('sessionToken');
    if (sessionToken != null) {

      http.Response res = await Request.checkSessionToken(sessionToken);

      if (res.statusCode == 200) {
        return true;
      }
      
      if(res.body == 'false') {
        return false;
      }

      String? username = await Storage.read('username');
      String? password = await Storage.read('password');

      if (username == null || password == null) {
        return false;
      }

      res = await Request.login(username, password);
      if (res.statusCode == 200) {
        await Storage.write('sessionToken', res.body);
        return true;
      }
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
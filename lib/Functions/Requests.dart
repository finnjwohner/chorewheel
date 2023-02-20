import 'package:http/http.dart' as http;
import 'dart:convert'; // This includes the jsonEncode() function

class Request {

  static Future<http.Response> login(String username, String password) async {

    return http.post(
      Uri.parse('https://chorewheel.azurewebsites.net/api/Login?code=kEixt5doLa9dmGV6gb2QSyuW5mgZX1ksYVwdbVH--oAkAzFuLGmK2w=='), // Login API URI
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      // The json to send in the request
      body: jsonEncode(
        <String, String> {
          'username': username,
          'password': password,
        }
      ),
    );
  }

  static Future<http.Response> register(String username, String password, String email) {
    return http.post(
      Uri.parse('https://chorewheel.azurewebsites.net/api/CreateAccount?code=0XIBOCtsA0ihfsFJ2x1CmFBCopCugHFPA2652cv1BjonAzFu1wdMsA=='), // Login API URI
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      // The json to send in the request
      body: jsonEncode(
        <String, String> {
          'username': username,
          'email': email,
          'password': password,
        }
      ),
    );
  }

  static Future<http.Response> checkSessionToken(String sessionToken) async {
    return await http.post(
      Uri.parse('https://chorewheel.azurewebsites.net/api/CheckSessionToken?code=ehHvCe0laJDGZstucoe9MWd5QuxHZonyi7WJ1EKnkhIlAzFu9ogqyw=='), // Login API URI
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      // The json to send in the request
      body: jsonEncode(
        <String, String> {
          'sessionToken': sessionToken,
        }
      ),
    );
  }
}
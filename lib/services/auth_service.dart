
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multisuministros/utils/env.dart';

class AuthService {
  // This class will handle authentication-related tasks
  // such as login, logout, and user session management.

  bool _authProcess = false;

  set authProcess(bool value) {
    _authProcess = value;
  }
  // Example method for user login
  Future<bool> login(String email, String password) async {
    // Implement your login logic here
    authProcess = true;

    final data = {
      'email': email,
      'password': password,
    };

    final resp = await http.post(Uri.parse('${ Env.baseurl } /login'),
    body: jsonEncode(data),
    headers: {
      'Content-Type': 'application/json'
    });

    print(resp.statusCode);
    if(resp.statusCode != 200) {
      authProcess = false;
      print('no se pudo iniciar sesion');
      return false; // Return false if login fails
    }
    if (resp.statusCode == 200) {
      print('login exitoso');
      return true;
      // final Map<String, dynamic> responseData = jsonDecode(resp.body);
      // if (responseData['status'] == 'success') {
      //   // Handle successful login
      //   print('Login successful');
      //   authProcess = false;
      //   return true; // Return true if login is successful
      // } else {
      //   // Handle failed login
      //   print('Login failed: ${responseData['message']}');
      //   authProcess = false;
      //   return false; // Return false if login fails
      // }
    }
    authProcess = false;
    return false;



    return true; // Return true if login is successful
  }

  // Example method for user logout
  Future<void> logout() async {
    // Implement your logout logic here
  }

  // Example method to check if the user is logged in
  Future<bool> isLoggedIn() async {
    // Implement your logic to check if the user is logged in
    return false; // Return true if the user is logged in
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multisuministros/models/user.dart';
import 'package:multisuministros/utils/env.dart';

class AuthService {
  // This class will handle authentication-related tasks
  // such as login, logout, and user session management.

  bool _authProcess = false;

  set authProcess(bool value) {
    _authProcess = value;
  }
  // Example method for user login
  Future<User?> login(String email, String? password) async {
    // Implement your login logic here
    //authProcess = true;

    User? user = null;//User(email: 'email', password: 'password');

    final data = {
      'email': email,
      'password': password,
    };

    final resp = await http.post(Uri.parse('${ Env.baseurl }/login'),
    body: jsonEncode(data),
    headers: {
      'Content-Type': 'application/json'
    });


    if(resp.statusCode != 200) {
      print('login error ${resp.body}');
      //authProcess = false;
      return user; // Return false if login fails
    }
    if (resp.statusCode == 200) {
      //print('login exitoso ${resp.body}');//flutter: login exitoso {"status":"success","data":{"name":"admin","email":"admin@gmail.com","token":"8|jn5kevsYJWS3cgFZ6pO7i02mwD0UMcXNia5Kbpk60a9c9393"}}

      final Map<String, dynamic> responseData = jsonDecode(resp.body);
      if (responseData['status'] == 'success') {
        // Handle successful login
        print('Login successful authservice');
        //authProcess = false;
        User userLogin = User.fromJson(responseData['data']);
        print(responseData['data']);
        print(userLogin.toString());

        return userLogin; // Return true if login is successful
      } else {
        // Handle failed login
        print('Login failed: ${responseData['message']}');
        //authProcess = false;
        
        return user; // Return false if login fails
      }
    }
    //authProcess = false;
    return user;
// Return true if login is successful
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
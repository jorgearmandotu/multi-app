
import 'package:http/http.dart' as http;

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

    final resp = await http.post(Uri.parse('${ Environment.apiUrl }/login'),
    body: jsonEncode(data),
    headers: {
      'Content-Type': 'application/json'
    });

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
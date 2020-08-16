import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:osk_dev_app/model/core/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _authFirebase = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String _name;
  String _email;
  String _phone;
  String _password;

  AuthService() {
    this._name;
    this._email;
    this._phone;
    this._password;
  }

  void set setUserName(String name) => this._name = name;

  void set setUserEmail(String email) => this._email = email;

  void set setUserPhone(String phone) => this._phone = phone;

  void set setUserPassword(String password) => this._password = password;

  //1. Pass user data from UI to Provider AuthService
  //2. AuthService Provider converts data to string (either using toJSON method)
  //3. Post the user data to the server.

  Future<User> registerUserRequest() async {
    try {
      String registerUrl =
          "http://api.onestopkitchen.in/api/registeruser?password=$_password&email=$_email&mobile=${int.parse(_phone)}&name=$_name";
      Map<String, String> headers = {"Content-Type": "application/json"};
      http.Response response = await http.post(registerUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);
        if (result != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('userInfo', "Registered");
          print(
              "Successfully registered user -> Status Code: ${response.statusCode}");
          return User.fromJson(result);
        }
      } else {
        print(
            "Error while registering user -> Status Code: ${response.statusCode}");
      }
    } catch (err) {
      print("Error in registering User with API: ${err}");
    }
  }

  Future<User> loginUserRequest() async {
    try {
      String loginUrl =
          "http://api.onestopkitchen.in/api/getuser?email=$_email&password=$_password";
      Map<String, String> headers = {"Content-Type": "application/json"};
      http.Response response = await http.get(loginUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);
        if (result != null) {
          print(result);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('userInfo', "LoggedIn");
          print(
              "Successfully Logged in -> Status Code: ${response.statusCode}");
          return User.fromJson(result);
        }
      } else {
        print(
            "Error while logging in user -> Status Code: ${response.statusCode}");
      }
    } catch (err) {
      print("Error in logging in User with API: ${err}");
    }
  }

  Future<bool> logoutUserRequest() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('userInfo');
      print(prefs.getString('userInfo'));
      return true;
    } catch (err) {
      print("Error in logging out User through shared preferences: ${err}");
    }
  }

  Future<User> _userFromFirebase(FirebaseUser user) async {
    if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userInfo', "LoggedIn");
      return User(
          id: user.uid,
          email: user.email,
          name: user.displayName,
          phone: user.phoneNumber);
    } else {
      return null;
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn(); //Getting User account
      GoogleSignInAuthentication
          googleSignInAuthentication = //Authenticating User Account
          await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      AuthResult result = await _authFirebase.signInWithCredential(credential);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebase(firebaseUser);
    } catch (err) {
      print("Error in signInWithGoogle: ${err}");
      return null;
    }
  }

  Future signOutWithGoogle() async {
    try {
      return await _googleSignIn.signOut();
    } catch (err) {
      print("Error in signOut : ${err}");
      return null;
    }
  }
}

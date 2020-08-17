import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:osk_dev_app/model/core/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String phoneno;
  String name;
  String email;

  Future getOtp() async {
    try {
      String getOtpUrl =
          "http://api.onestopkitchen.in/api/sendotp?number=$phoneno";
      Map<String, String> headers = {"Content-Type": "application/json"};
      http.Response response = await http.get(getOtpUrl, headers: headers);
      if (response.statusCode == 200) {
        print("Success -> Status Code: ${response.statusCode}");
        print(response.body);
        final result = await jsonDecode(response.body);
        return result;
      } else {
        print("Error in getting otp -> Status Code: ${response.statusCode}");
      }
    } catch (err) {
      print("Error in getting Otp using API : ${err}");
    }
  }

  Future registerUser() async {
    try {
      String registerUserUrl =
          "http://api.onestopkitchen.in/api/registeruser?number=${int.parse(phoneno)}";
      Map<String, String> headers = {"Content-Type": "application/json"};
      http.Response response = await http.post(registerUserUrl);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Success -> Status Code: ${response.statusCode}");
        final user_id = await jsonDecode(response.body);
        return user_id;
      } else {
        print(
            "Error in registering user-> Status Code: ${response.statusCode}");
      }
    } catch (err) {
      print("Error in registering user using API : ${err}");
    }
  }

  Future<UserClass> addtoUser() async {
    try {
      print("$name $email $phoneno");
      String addtoUserUrl =
          "http://api.onestopkitchen.in/api/addtouser?number=${int.parse(phoneno)}&email=$email&name=$name";
      Map<String, String> headers = {"Content-Type": "application/json"};
      http.Response response = await http.post(addtoUserUrl);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Success -> Status Code: ${response.statusCode}");
        final users = userFromJson(response.body);
        if (users != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('userInfo', "Registered");
          return users.user;
        }
      } else {
        print("Error in add to user-> Status Code: ${response.statusCode}");
      }
    } catch (err) {
      print("Error in add to user using API : ${err}");
    }
  }

  Future<UserClass> getUser() async {
    try {
      String getUserUrl =
          "http://api.onestopkitchen.in/api/getuser?number=$phoneno";
      Map<String, String> headers = {"Content-Type": "application/json"};
      http.Response response = await http.get(getUserUrl, headers: headers);
      if (response.statusCode == 200) {
        print("Success -> Status Code: ${response.statusCode}");
        final users = userFromJson(response.body);
        if (users != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('userInfo', "LoggedIn");
          return users.user;
        }
      } else {
        print("Error in getting user-> Status Code: ${response.statusCode}");
      }
    } catch (err) {
      print("Error in getting user using API : ${err}");
    }
  }

  Future<bool> logoutUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('userInfo');
      return true;
    } catch (err) {
      print("Error in logging out User through shared preferences: ${err}");
    }
  }
}

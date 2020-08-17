import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:osk_dev_app/model/core/User.dart';
import 'package:osk_dev_app/model/services/authService.dart';

class AuthProvider extends ChangeNotifier {
  String _results;
  String _phoneno;
  String _name;
  String _email;
  int otp;
  dynamic user_exist;
  dynamic get results => _results;

  //Service Api Request
  final _authService = AuthService();


  setPhoneNo(String n) {
    _phoneno = n;
  }

  setName(String n) {
    _name = n;
  }

  setEmail(String e) {
    _email = e;
  }

  Future getOtp() async {
    _authService.phoneno = _phoneno;
    final _results = await _authService.getOtp();
    print(_results['success']);
    otp = _results['otp'];
    user_exist = _results['user_exists'];
    return _results;
  }

  Future registerUser() async {
    _authService.phoneno = _phoneno;
    final _result = await _authService.registerUser();
    return _result;
  }

  Future<UserClass> addtoUser() async {
    _authService.name = _name;
    _authService.email = _email;
    _authService.phoneno = _phoneno;
    final _results = await _authService.addtoUser();
    print(_results);
    return _results;
  }

  Future<UserClass> getUser() async {
    final user = await _authService.getUser();
    return user;
  }

  Future<bool> logoutUser() async {
    final result = await _authService.logoutUser();
    return result;
  }
}

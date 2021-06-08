import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pa_fjt_mobile/utils/constant.dart';
import 'package:pa_fjt_mobile/error/exception.dart';
import 'package:pa_fjt_mobile/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final http.Client client = http.Client();

  User? _currentUser;
  User? get currentUser => _currentUser;

  static final UserService _singleton = UserService._internal();

  String? _token;
  String? get token => _token;

  UserService._internal();
  final String SHARED_KEY_USER = 'current_user';

  factory UserService() {
    return _singleton;
  }

  Future loadData() async {
    _currentUser = await this.getSavedUser();
  }

  Future<User> loginUser(String? email, String? password) async {
    if (email == null || password == null) {
      throw Exception('null email or password given');
    }

    final response = await client.post(Uri.parse("$LOGINHOST/users/login"),
        body:
            json.encode({'email': email, 'password': password, 'role': 'user'}),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      print(response.body);
      if (response.headers.containsKey('authorization')) {
        _token = response.headers['authorization'];
        await this.saveUser(User(email: email, password: password));
      } else {
        print(response.body);
        throw ServerException();
      }
      return userFromJson(response.body);
      // return UserModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 403) {
      print(response.body);
      throw BadCredentialsException();
    } else {
      print(response.body);
      throw ServerException();
    }
  }

  Future saveUser(User user) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString(SHARED_KEY_USER, userToJson(user));
    _currentUser = user;
  }

  Future<User?> getSavedUser() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    String? json = shared.getString(SHARED_KEY_USER);
    User? user;
    if (json != null) {
      user = userFromJson(json);
    }
    return user;
  }

  Future removeSavedUser() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.remove(SHARED_KEY_USER);
  }

  Future resetUser() async {
    await this.removeSavedUser();
    this._currentUser = null;
  }

  bool get isAuthenticated => this.currentUser != null;

  Future registerUser(
      {required String firstname,
      required String lastname,
      required String email,
      required String password,
      required String password2}) async {
    final Map body = {
      'firstName': firstname,
      'lastName': lastname,
      'password': password,
      'password2': password2,
      'role': 'user',
      'email': email
    };
    final response = await client.post(Uri.parse("$LOGINHOST/users/register"),
        body: json.encode(body), headers: {'Content-Type': 'application/json'});

    print("register response = ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.statusCode);
      return userFromJson(response.body);
    } else if (response.statusCode == 403) {
      throw BadCredentialsException();
    } else if (response.statusCode == 400) {
      throw BadRequestException();
    } else {
      print(response.statusCode);
      // throw ServerException();
    }
  }
}

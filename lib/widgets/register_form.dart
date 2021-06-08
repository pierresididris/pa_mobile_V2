import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pa_fjt_mobile/services/authentication_api.dart';

import '../app_router.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController username = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password2 = TextEditingController();
  final TextEditingController email = TextEditingController();

  // final GlobalKey<FormState> _form = GlobalKey<FormState>();
  // final TextEditingController _pass = TextEditingController();
  // final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          //FirstName
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'user_firstname_hint'),
            controller: firstname,
          ),
          // LastName
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'user_lastname_hint'),
            controller: lastname,
          ),
          TextFormField(
            validator: (value) {
              final pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regex = new RegExp(pattern);
              if (!(regex.hasMatch(value!))) return 'email_error';
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'email_hint'),
            controller: email,
          ),

          TextFormField(
            obscureText: true,
            validator: (value) {
              final pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
              RegExp regex = new RegExp(pattern);
              if (!(regex.hasMatch(value!))) return 'password_error';
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'password_hint'),
            controller: password,
          ),
          // Password 2
          TextFormField(
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) return 'password_error2';
              if (value != password.text) return 'password_error3';
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'password_repeat_hint'),
            controller: password2,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: ButtonTheme(
                height: 60,
                child: RaisedButton(
                  child: Text('register_button'),
                  color: Theme.of(context).primaryColor,
                  textTheme: ButtonTextTheme.primary,
                  onPressed: () {
                    UserService()
                        .registerUser(
                            firstname: firstname.text,
                            lastname: lastname.text,
                            password2: password2.text,
                            email: email.text,
                            password: password.text)
                        .then((_) {
                      if (UserService().isAuthenticated) {
                        Navigator.pushNamedAndRemoveUntil(context,
                            NamedRoute.CONNECTION_ROUTE, (Route r) => false);
                      } else {
                        print('authentication failed!');
                      }
                    });
                  },
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}

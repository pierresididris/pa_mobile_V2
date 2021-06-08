import 'package:flutter/material.dart';
import 'package:pa_fjt_mobile/app_router.dart';
import 'package:pa_fjt_mobile/error/exception.dart';
import 'package:pa_fjt_mobile/services/authentication_api.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    // email.text = 'pierre.sididris@live.fr';
    // password.text = 'password123';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          //textField
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                hintText: 'mail_hint'),
            controller: email,
          ),
          SizedBox(height: 30),
          TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: 'password_hint'),
              controller: password),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, NamedRoute.INSCRIPTION_ROUTE);
                },
                child: Text("register"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Mot de passe oublié"),
              ),
            ],
          ),
          // SizedBox(height: 150),
          Row(
            children: <Widget>[
              Expanded(
                  child: ButtonTheme(
                height: 60,
                child: RaisedButton(
                  child: Text('connection_button'),
                  color: Theme.of(context).primaryColor,
                  textTheme: ButtonTextTheme.primary,
                  onPressed: () {
                    // hide keyboard
                    FocusScope.of(context).unfocus();
                    UserService()
                        .loginUser(email.text, password.text)
                        .then((_) {
                      if (UserService().isAuthenticated) {
                        Navigator.pushNamed(context, NamedRoute.HOME_ROUTE);
                      } else {
                        print('authentication failed!');
                      }
                    }).catchError((error) {
                      if (error is ServerException) {
                        SnackBar snackbar = SnackBar(
                            content: Text('une erreur serveur est intervenue'));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      } else if (error is BadCredentialsException) {
                        SnackBar snackbar = SnackBar(
                            content: Text(
                                'adresse e-mail ou mot de passe incorrect'));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
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

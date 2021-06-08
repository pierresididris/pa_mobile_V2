import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pa_fjt_mobile/widgets/authform.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenu'),
      ),
      body: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Center(
            child: Column(
              children: <Widget>[
                AuthForm(),
              ],
            ),
          )),
    );
  }
}

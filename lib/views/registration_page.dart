import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pa_fjt_mobile/widgets/authform.dart';
import 'package:pa_fjt_mobile/widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenu'),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: ListView(
              children: <Widget>[
                RegisterForm(),
              ],
            ),
          )),
    );
  }
}

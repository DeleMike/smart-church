import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height * 0.5,
      width: deviceSize.width * 0.85,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top: 80, left: 16, bottom: 16, right: 16),
      child: Card(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Register your church',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

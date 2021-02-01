import 'package:flutter/material.dart';

import '../widgets/auth/auth_form.dart';
import '../widgets/auth/landscape_auth.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Smart Church'),
        // ),
        body: OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return _buildPotraitMode(context, deviceSize);
      } else {
        return LandscapeAuthScreen();
      }
    }));
  }

  //return potrait view
  Widget _buildPotraitMode(BuildContext context, Size deviceSize) {
    return Stack(
      children: [
        Container(
          height: deviceSize.height * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: Color(0xff1775d1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/church.png'),
                ),
              ),
              Center(
                child: Text(
                  'Smart Church',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150),
              AuthForm(),
            ],
          ),
        ),
      ],
    );
  }
}

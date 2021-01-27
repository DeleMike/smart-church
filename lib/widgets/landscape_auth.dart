import 'package:flutter/material.dart';

import '../widgets/auth_form.dart';

class LandscapeAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: deviceSize.width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Color(0xff1775d1),
            ),
            child: Column(
              children: [
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/church.png'),
                  ),
                ),
                SizedBox(height: 50.0),
                Center(
                  child: Text('Smart Church',
                      style: Theme.of(context).textTheme.headline2),
                ),
              ],
            ),
          ),
          Container(
            width: deviceSize.width * 0.6,
            height: deviceSize.height,
            child: AuthForm(), 
            // child: Card(
            //     child: SingleChildScrollView(
            //   child: Column(
            //     children: [

            //     ],
            //   ),
            // )),
          ),
        ],
      ),
    );
  }
}

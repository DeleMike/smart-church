import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

enum AuthMode {
  Register,
  Login,
}

class _AuthFormState extends State<AuthForm>
    with SingleTickerProviderStateMixin {
  AuthMode _authMode = AuthMode.Register;
  AnimationController _controller;
  Animation<Offset> _slideAnimation;
  Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Register) {
      setState(() {
        _authMode = AuthMode.Login;
      });
      _controller.reverse();
    } else {
      setState(() {
        _authMode = AuthMode.Register;
      });
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      child: Container(
        height: _authMode == AuthMode.Register
            ? deviceSize.height * 0.65
            : deviceSize.height * 0.45,
        width: deviceSize.width,
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
                    _authMode == AuthMode.Register ? 'REGISTER' : 'LOGIN',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    key: ValueKey('name'),
                    keyboardType: TextInputType.name,
                    autocorrect: true,
                    decoration: InputDecoration(
                      labelText: 'Church Name',
                      labelStyle: Theme.of(context).textTheme.bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 0.0),
                      ),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _authMode == AuthMode.Register,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            key: ValueKey('email'),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: true,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: Theme.of(context).textTheme.bodyText2,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.0),
                              ),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    key: ValueKey('password'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: Theme.of(context).textTheme.bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 0.0),
                      ),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _authMode == AuthMode.Register,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            key: ValueKey('confirm-password'),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelStyle: Theme.of(context).textTheme.bodyText2,
                              labelText: 'Confirm Password',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.0),
                              ),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text(
                    'SUBMIT',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  onPressed: () {},
                ),
                //used to switch between login and sign up
                FlatButton(
                  child: Text(
                    _authMode == AuthMode.Register
                        ? 'Already have an account?'
                        : 'I don\'t have an account?',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  onPressed: _switchAuthMode,
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

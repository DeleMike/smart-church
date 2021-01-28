import 'package:flutter/material.dart';

import '../../screens/tab_screen.dart';

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
  AuthMode _authMode = AuthMode.Login;
  AnimationController _controller;
  Animation<Offset> _slideAnimation;
  Animation<double> _opacityAnimation;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  Map<String, String> _authData = {
    'church-name': '',
    'email': '',
    'password': '',
  };

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

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      setState(() {
        _isLoading = true;
      });
      try {
        if (_authMode == AuthMode.Login) {
          print(
              'AuthMode.Login: Church name = ${_authData['church-name']} -- Password = ${_authData['password']}');
        } else {
          print(
              'AuthMode.Register: Church name = ${_authData['church-name']} -- Email = ${_authData['email']} -- Password = ${_authData['password']}');
        }
        Navigator.pushNamed(context, TabScreen.routeName);
      } catch (error) {
        const errorMessage =
            'Could not authenticate you. Please try again later';
        print('Auth Form: Error = $errorMessage');
      }
      setState(() {
        _isLoading = false;
      });
    }
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
    final orientation = MediaQuery.of(context).orientation;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      child: Container(
        height: _authMode == AuthMode.Register
            ? deviceSize.height * 0.65
            : deviceSize.height * 0.5,
        width: deviceSize.width,
        padding: const EdgeInsets.all(10.0),
        margin: EdgeInsets.only(
          top: orientation == Orientation.landscape ? 16 : 80,
          left: 16,
          bottom: 1,
          right: 16,
        ),
        child: Card(
          child: Form(
            key: _formKey,
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
                      validator: (name) {
                        if (name.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onSaved: (name) {
                        _authData['church-name'] = name;
                      },
                      decoration: InputDecoration(
                        labelText: 'Church Name',
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 0.0),
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
                              enabled: _authMode == AuthMode.Register,
                              validator: (email) {
                                if (email.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!email.contains('@')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              onSaved: (email) {
                                _authData['email'] = email;
                              },
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                labelStyle:
                                    Theme.of(context).textTheme.bodyText2,
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
                      controller: _passwordController,
                      validator: (password) {
                        if (password.length < 6) {
                          return 'Please a password with at least 6 characters';
                        }
                        return null;
                      },
                      onSaved: (password) {
                        _authData['password'] = password;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: Theme.of(context).textTheme.bodyText2,
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
                              enabled: _authMode == AuthMode.Register,
                              validator: _authMode == AuthMode.Register
                                  ? (value) {
                                      if (value != _passwordController.text) {
                                        return 'Your password do no match';
                                      }
                                      return null;
                                    }
                                  : null,
                              decoration: InputDecoration(
                                labelStyle:
                                    Theme.of(context).textTheme.bodyText2,
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
                  if (_isLoading) Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(),
                  ),
                  if (!_isLoading)
                    RaisedButton(
                      child: Text(
                        'SUBMIT',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      onPressed: _trySubmit,
                    ),
                  //used to switch between login and sign up
                  if (!_isLoading)
                    FlatButton(
                      child: Text(
                        _authMode == AuthMode.Register
                            ? 'Already have an account?'
                            : 'I don\'t have an account?',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      onPressed: _switchAuthMode,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textColor: Theme.of(context).primaryColor,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_php_api/services/api.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Login With Api'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple)),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: (OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple))),
                            ),
                            controller: emailController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Email is Empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'Password',
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple)),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: (OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple))),
                            ),
                            controller: passwordController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password is Empty';
                              }
                              return null;
                            },
                          ),
                          
                          SizedBox(height: 20.0),
                          RaisedButton(
                              color: Colors.deepPurple,
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  var email = emailController.text;
                                  var password = passwordController.text;
                                  setState(() {
                                    message = 'Please wait......';
                                  });
                                  var rsp = await loginUser(email, password);
                                  if (rsp.containsKey('status')) {
                                    if (rsp['status'] == 1) {
                                      setState(() {
                                        message = rsp['status_text'];
                                      });
                                      if (rsp['status'] == 1) {
                                        Navigator.pushNamed(context, '/index');
                                      }
                                    } else {
                                      setState(() {
                                        message =
                                            'Login Failed, Please Try Again';
                                      });
                                    }
                                  }
                                }
                              }),
                          Text(message),
                        ],
                      )),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

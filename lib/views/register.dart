import 'package:flutter/material.dart';
import 'package:flutter_php_api/services/api.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
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
                              labelText: 'Name',
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
                            controller: nameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Name is Empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.0),
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
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
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
                            controller: phoneController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Phone Number is Empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Address',
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
                            controller: addressController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Address is Empty';
                              }
                              return null;
                            },
                          ),
                          
                          SizedBox(height: 20.0),
                          RaisedButton(
                              color: Colors.deepPurple,
                              child: Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  var name = nameController.text;
                                  var email = emailController.text;
                                  var password = passwordController.text;
                                  var phone = phoneController.text;
                                  var address = addressController.text;
                                  setState(() {
                                    message = 'Please wait......';
                                  });
                                  var rsp = await registerUser(name, email, password, phone, address);
                                  print(rsp);
                                  if (rsp.containsKey('status')) {
                                    if (rsp['status'] == 1) {
                                      setState(() {
                                        message = rsp['status_text'];
                                      });
                                      if (rsp['status'] == 1) {
                                        Navigator.pushNamed(context, '/login');
                                      }
                                    } else {
                                      setState(() {
                                        message =
                                            'Login Failed, Please Try Again';
                                      });
                                    }
                                  }
                              }}),
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

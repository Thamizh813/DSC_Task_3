import 'package:dsc_task_3/LoginPage.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'methods.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isObscure = true;
  bool isObscure1 = true;
  bool showProgress = false;
  String username = '', email = '', password = '', confirmpassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Registration form",
          style: GoogleFonts.raleway(
            color: Colors.deepOrange,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ModalProgressHUD(
        color: Colors.black,
        inAsyncCall: showProgress,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 60.0, vertical: 30.0),
                child: Text(
                  "Welcome to our App",
                  style: GoogleFonts.raleway(
                    color: Colors.deepOrange,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "REGISTER",
                style: GoogleFonts.raleway(
                  color: Colors.deepOrange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    username = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  obscureText: isObscure,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: IconButton(
                          icon: Icon(isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          }),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  obscureText: isObscure1,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    confirmpassword = value;
                  },
                  decoration: InputDecoration(
                      hintText: "confirm Password",
                      suffixIcon: IconButton(
                          icon: Icon(isObscure1
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isObscure1 = !isObscure1;
                            });
                          }),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Material(
                elevation: 5,
                color: Colors.black,
                borderRadius: BorderRadius.circular(32.0),
                child: MaterialButton(
                  onPressed: () async {
                    if (username.toString().isNotEmpty &&
                        email.toString().isNotEmpty &&
                        password.toString().isNotEmpty &&
                        confirmpassword.toString().isNotEmpty) {
                      setState(() {
                        showProgress = true;
                      });

                      createAccount(username.toString(), email.toString(),
                              password.toString(), confirmpassword.toString())
                          .then((user) {
                        if (user != null) {
                          Fluttertoast.showToast(
                            msg: 'Reistered successfully',
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.deepOrange,
                            toastLength: Toast.LENGTH_SHORT,
                          );
                          setState(() {
                            showProgress = false;
                          });
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LoginPage()));
                        } else {
                          Fluttertoast.showToast(
                            msg: 'Reistered failed...or already registered...',
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.white,
                            textColor: Colors.deepOrange,
                            toastLength: Toast.LENGTH_SHORT,
                          );

                          setState(() {
                            showProgress = false;
                          });
                        }
                      });
                    }
                  },
                  minWidth: 200.0,
                  height: 45.0,
                  child: Text(
                    "Register",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

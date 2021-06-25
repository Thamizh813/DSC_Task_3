import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'methods.dart';

void main() => runApp(First());

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome user"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 300, horizontal: 50),
            child: Material(
              elevation: 5,
              color: Colors.black,
              borderRadius: BorderRadius.circular(32.0),
              child: MaterialButton(
                onPressed: () => logOut(context),
                minWidth: 150.0,
                height: 45.0,
                child: Center(
                  child: Text(
                    "Sign out",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

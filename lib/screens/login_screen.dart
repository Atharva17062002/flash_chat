import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id2 = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpin = false;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpin,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: (kInputDecor.copyWith(
                      hintText: 'Enter your email',
                      hintStyle: const TextStyle(color: Colors.grey)))),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  style: const TextStyle(color: Colors.black),
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: (kInputDecor.copyWith(
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(color: Colors.grey)))),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  colour: Colors.lightBlueAccent, name: 'Log in', pressed: () {
                    setState(() {
                      showSpin=true;
                    });
                    try {
                      final user = _auth.signInWithEmailAndPassword(email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id1);
                      }
                      setState(() {
                        showSpin=false;
                      });
                    }catch(e){
                      print(e);
                    }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

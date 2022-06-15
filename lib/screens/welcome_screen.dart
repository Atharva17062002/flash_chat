import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;

  @override
  void initState(){
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
      // upperBound: 100.0
    );
    animation = ColorTween(begin: Colors.red,end: Colors.blue).animate(controller);
    controller.forward();
    
    controller.addListener(() {
      setState(() {

      });
      print(animation.value);
    });
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                    // width: 50,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(colour: Colors.lightBlueAccent,
                name: 'Log in',
                pressed:(){Navigator.pushNamed(context, LoginScreen.id2);}),
            RoundedButton(colour: Colors.blueAccent,
                name: 'Register'  ,
                pressed: (){Navigator.pushNamed(context, RegistrationScreen.id3);}),
          ],
        ),
      ),
    );
  }
}

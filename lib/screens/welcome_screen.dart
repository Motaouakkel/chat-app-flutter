import 'package:Talk/screens/registration_screen.dart';
import 'package:Talk/screens/singin_screen.dart';
import 'package:Talk/widgets/my_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  // const WelcomeScreen({ Key? key }) : super(key: key);
  static const String screenRoute = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(
                height: 20.0,
              ),
              MyButton(
                color: Color(0xFF3A74BA),
                title: 'Sign in',
                onPressed: () {
                  Navigator.pushNamed(context, SinginScreen.screenRoute);
                },
              ),
              MyButton(
                color: Color(0xFF6BC392),
                title: 'Sign up',
                onPressed: () {
                  Navigator.pushNamed(context, RegisrationScreen.screenRoute);
                },
              )
            ]),
      ),
    );
  }
}


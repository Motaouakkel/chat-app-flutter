import 'package:Talk/screens/chat_screen.dart';
import 'package:Talk/screens/registration_screen.dart';
import 'package:Talk/screens/singin_screen.dart';
import 'package:Talk/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: ChatScreen(),
      initialRoute: WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute : (context) => WelcomeScreen(),
        SinginScreen.screenRoute : (context) => SinginScreen(),
        RegisrationScreen.screenRoute : (context) => RegisrationScreen(),
        ChatScreen.screenRoute : (context) => ChatScreen(),
      },
    );
  }
}

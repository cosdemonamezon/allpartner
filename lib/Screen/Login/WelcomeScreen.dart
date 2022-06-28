
import 'package:allpartner/Screen/Login/LoginScreen.dart';
import 'package:allpartner/Screen/Register/RegisterScreen.dart';
import 'package:allpartner/Screen/Widgets/ButtonRounded.dart';
import 'package:allpartner/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      extendBody: true,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/screen1.png'),
            fit: BoxFit.fill,
          ),
          gradient: LinearGradient(
            colors: [kLogin2Color, kLoginColor],
            stops: [0.0, 0.7],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: kDefaultHorizonPadding,
        margin: EdgeInsets.only(bottom: padding.bottom + 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonRounded(
              text: 'Login',
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
              },
            ),
            SizedBox(height: 8),
            ButtonRounded(
              text: 'Register',
              color: Color.fromARGB(255, 247, 244, 244),
              textColor: Colors.blue,
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

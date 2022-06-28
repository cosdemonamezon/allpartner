
import 'package:allpartner/Screen/Allpartner/AllpartnerHome.dart';
import 'package:allpartner/Screen/Login/Widgets/AppTextForm.dart';
import 'package:allpartner/Screen/Widgets/ButtonRounded.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoadding = false;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //extendBody: true,
      body: SafeArea(
        child: isLoadding == true
            ? Center(
                child: SizedBox(
                  width: size.width / 1.5,
                  height: 140,
                  child: Image.asset("assets/images/645bf.gif"),
                ),
              )
            : SingleChildScrollView(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/ALLZERVE.png',
                          height: 200,
                          width: 250,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: loginFormKey,
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          AppTextForm(
                            controller: email,
                            hintText: 'Email',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          AppTextForm(
                            controller: password,
                            hintText: 'Password',
                            isPassword: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    ButtonRounded(
                      text: 'Login',
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        //login(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AllPartnerHome()));
                      },
                    ),
                    SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'ForgotPassword',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  // void login(context) async {
  //   final SharedPreferences prefs = await _prefs;
  //   setState(() {
  //     isLoadding = true;
  //   });
  //   final response =
  //       await LoginApi.login(email: email.text, password: password.text);
  //   if (response['status_api']) {
  //     await prefs.setString('token', response['token']);      
        
  //       Future.delayed(Duration(seconds: 3), () {
  //         setState(() {
  //             isLoadding = false;
  //           });
  //         if (response['data']['firstName'] == 'allserve') {
  //             Navigator.pushReplacement(context,
  //                 MaterialPageRoute(builder: (context) => AllServeHome()));
  //           } else if (response['data']['firstName'] == 'alljob') {
  //             Navigator.pushReplacement(context,
  //                 MaterialPageRoute(builder: (context) => AlljobHome()));
  //           } else if (response['data']['firstName'] == 'allpartner') {
  //             Navigator.pushReplacement(context,
  //                 MaterialPageRoute(builder: (context) => AllPartnerHome()));
  //           } else {
  //             Navigator.pushReplacement(context,
  //                 MaterialPageRoute(builder: (context) => AllPartnerHome()));
  //           }
          
  //       });
      
  //   } else {
  //     print(response);
  //   }
  // }
}

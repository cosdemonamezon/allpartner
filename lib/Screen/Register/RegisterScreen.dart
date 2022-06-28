import 'dart:developer';

import 'package:allpartner/Screen/Register/Widgets/RegisTextField.dart';
import 'package:allpartner/Screen/Widgets/BackButtonWithOrIcon.dart';
import 'package:allpartner/Screen/Widgets/ButtonRounded.dart';
import 'package:allpartner/appTheme.dart';
import 'package:allpartner/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController phone = TextEditingController();
  bool isLoadding = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final appFontSize = AppFontSize.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: isLoadding == true
            ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width / 1.5,
                    height: 140,
                    child: Image.asset("assets/images/645bf.gif"),
                  ),
                ],
              )
            : Stack(
                children: [
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () =>
                          FocusScope.of(context).requestFocus(FocusNode()),
                    ),
                  ),
                  SafeArea(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 21),
                        constraints: BoxConstraints(maxWidth: 900),
                        child: Form(
                          key: registerFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              BackButtonWithOrIcon(),
                              SizedBox(height: 22),
                              Text(
                                'สมัครสมาชิก',
                                style: TextStyle(
                                  fontSize: appFontSize?.title,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 50),
                              Text(
                                'อีเมล',
                                style: TextStyle(fontSize: appFontSize?.body),
                              ),
                              SizedBox(height: 10),
                              RegisTextField(
                                controller: email,
                                hintText: 'กรอก อีเมล',
                              ),
                              SizedBox(height: 16),
                              Text(
                                'ชื่อ',
                                style: TextStyle(fontSize: appFontSize?.body),
                              ),
                              SizedBox(height: 10),
                              RegisTextField(
                                controller: firstname,
                                hintText: 'กรอกชื่อ',
                              ),
                              SizedBox(height: 16),
                              Text(
                                'นามสกุล',
                                style: TextStyle(fontSize: appFontSize?.body),
                              ),
                              SizedBox(height: 10),
                              RegisTextField(
                                controller: lastname,
                                hintText: 'กรอกนามสกุล',
                              ),
                              SizedBox(height: 16),
                              Text(
                                'เบอร์โทรศัพท์',
                                style: TextStyle(fontSize: appFontSize?.body),
                              ),
                              SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      '+66',
                                      style: TextStyle(
                                        fontSize: appFontSize?.body2,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: RegisTextField(
                                      controller: phone,
                                      hintText: 'กรอกเบอร์โทรศัพท์',
                                      maxLength: 10,
                                      isHideCounter: true,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                'รหัสผ่าน',
                                style: TextStyle(fontSize: appFontSize?.body),
                              ),
                              SizedBox(height: 10),
                              RegisTextField(
                                controller: password,
                                hintText: '••••••••••',
                                isPassword: true,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'ยืนยันรหัสผ่าน',
                                style: TextStyle(fontSize: appFontSize?.body),
                              ),
                              SizedBox(height: 10),
                              RegisTextField(
                                controller: confirmpassword,
                                hintText: '••••••••••',
                                isPassword: true,
                              ),
                              SizedBox(height: 16),
                              Container(
                                padding:
                                    EdgeInsets.only(bottom: padding.bottom),
                                height: size.height / 7,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 8),
                                      ButtonRounded(
                                        text: 'สมัครสมาชิก',
                                        color: kThemeTextColor,
                                        textColor: Colors.white,
                                        onPressed: () async {
                                          if (password.text != '') {
                                            //register(context);
                                          } else {}

                                          // FocusScope.of(context)
                                          //     .requestFocus(FocusNode());
                                          // Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).viewInsets.bottom *
                                        0.4,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  // void register(context) async {
  //   final SharedPreferences prefs = await _prefs;
  //   setState(() {
  //     isLoadding = true;
  //   });
  //   final response = await RegisterApi.register(
  //       email: email.text,
  //       password: password.text,
  //       firstname: firstname.text,
  //       lastname: lastname.text);
  //   if (response['status_api']) {
  //     inspect(response);
  //     await prefs.setString('token', response['token']);
  //     Future.delayed(Duration(seconds: 3), () {
  //       setState(() {
  //         isLoadding = false;
  //       });
  //       Navigator.pushReplacement<void, void>(
  //         context,
  //         MaterialPageRoute<void>(
  //           builder: (BuildContext context) => AlljobHome(),
  //         ),
  //       );
  //     });
  //   } else {
  //     print(response);
  //   }
  // }
}

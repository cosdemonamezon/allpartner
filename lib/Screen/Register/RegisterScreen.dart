import 'dart:developer';
import 'dart:io';

import 'package:allpartner/Screen/Register/Widgets/RegisTextField.dart';
import 'package:allpartner/Screen/Widgets/BackButtonWithOrIcon.dart';
import 'package:allpartner/Screen/Widgets/ButtonRounded.dart';
import 'package:allpartner/appTheme.dart';
import 'package:allpartner/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Login/WelcomeScreen.dart';
import '../Widgets/cupertinoAlertDialog.dart';
import 'Service.dart';

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
  File? _selectedFile;
  Widget getImageWidget() {
    if (_selectedFile != null) {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 80,
        child: ClipOval(
          child: Image.file(
            _selectedFile!,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 80,
        child: ClipOval(
          child: Image.asset(
            'assets/icons/user.png',
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  Future<void> getImage(ImageSource source) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        final cropped = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 90,
          maxHeight: 500,
          maxWidth: 500,
          compressFormat: ImageCompressFormat.jpg,
        );

        setState(() {
          _selectedFile = File(cropped!.path);
        });
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final appFontSize = AppFontSize.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/ALLZOffice.png', width: 80, height: 50),
          )
        ],
      ),
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
                      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
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
                              // BackButtonWithOrIcon(),
                              SizedBox(height: 20),
                              Text(
                                'สมัครสมาชิก',
                                style: TextStyle(
                                  fontSize: appFontSize?.title,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Stack(
                                children: [
                                  Center(
                                    child: getImageWidget(),
                                  ),
                                  Positioned(
                                    top: 130,
                                    left: 210,
                                    child: GestureDetector(
                                      onTap: () {
                                        getImage(ImageSource.gallery);
                                      },
                                      child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            color: Colors.grey,
                                          ),
                                          child: Icon(
                                            Icons.add_a_photo_outlined,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
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
                                'ชื่อบริษัท',
                                style: TextStyle(fontSize: appFontSize?.body),
                              ),
                              SizedBox(height: 10),
                              RegisTextField(
                                controller: firstname,
                                hintText: 'กรอกชื่อบริษัท',
                              ),
                              SizedBox(height: 16),
                              // Text(
                              //   'นามสกุล',
                              //   style: TextStyle(fontSize: appFontSize?.body),
                              // ),
                              // SizedBox(height: 10),
                              // RegisTextField(
                              //   controller: lastname,
                              //   hintText: 'กรอกนามสกุล',
                              // ),
                              // SizedBox(height: 16),
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
                                hintText: '',
                                isPassword: true,
                                validator: (value) {
                                  final regExp = RegExp(
                                    r'^(?=.*\d)(?=.*[a-zA-Z]).{0,}$',
                                  );
                                  if (value!.isEmpty || value == '') {
                                    return 'กรุณากรอกรหัสผ่าน';
                                  }
                                  if (value.length < 8 || value.length > 20) {
                                    return 'รหัสผ่านต้องมีความยาว 8 - 20 ตัวอักษร';
                                  }
                                  if (value != confirmpassword.text) {
                                    return 'รหัสผ่านไม่ตรงกัน';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              Text(
                                'ยืนยันรหัสผ่าน',
                                style: TextStyle(fontSize: appFontSize?.body),
                              ),
                              SizedBox(height: 10),
                              RegisTextField(
                                controller: confirmpassword,
                                hintText: '',
                                isPassword: true,
                                validator: (value) {
                                  if (value!.isEmpty || value == '') {
                                    return 'กรุณากรอกยืนยันรหัสผ่าน';
                                  }
                                  if (value.length < 8 || value.length > 20) {
                                    return 'รหัสผ่านต้องมีความยาว 8 - 20 ตัวอักษร';
                                  }
                                  if (value != password.text) {
                                    return 'รหัสผ่านไม่ตรงกัน';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              Container(
                                padding: EdgeInsets.only(bottom: padding.bottom),
                                height: size.height / 7,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 8),
                                      ButtonRounded(
                                        text: 'สมัครสมาชิก',
                                        color: kThemeTextColor,
                                        textColor: Colors.white,
                                        onPressed: () async {
                                          if (_selectedFile != null) {
                                            final userCompany = await RegisterService().setInformation(
                                              permission_id: '1',
                                              username: email.text,
                                              password: password.text,
                                              name: firstname.text,
                                              email: email.text,
                                              phone: phone.text,
                                              type: 'partner',
                                              line_token: '-',
                                              image: _selectedFile!,
                                            );
                                            // try {
                                            if (userCompany != null) {
                                              return showCupertinoDialog(
                                                  context: context,
                                                  builder: (context) => CupertinoQuestion(
                                                        title: 'ลงทะเบียนใช้งาน',
                                                        content: 'การลงทะเบียนสำเร็จ',
                                                        press: () {
                                                          Navigator.push(context,
                                                              MaterialPageRoute(builder: (context) => WelcomeScreen()));
                                                        },
                                                      ));
                                            }
                                          }
                                          return showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              backgroundColor: Colors.blueAccent,
                                              title: Text("Error", style: TextStyle(color: Colors.white)),
                                              content:
                                                  Text('กรุณาใส่ให้ครบทุกช่อง', style: TextStyle(color: Colors.white)),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('OK', style: TextStyle(color: Colors.white)))
                                              ],
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: MediaQuery.of(context).viewInsets.bottom * 0.4,
                              // )
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

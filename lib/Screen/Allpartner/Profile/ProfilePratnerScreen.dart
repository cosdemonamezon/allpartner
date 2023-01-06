import 'dart:io';

import 'package:allpartner/Screen/Widgets/PhoneFieldWidget.dart';
import 'package:allpartner/Screen/Widgets/TextFieldWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../app/appController.dart';

class ProfilePratnerScreen extends StatefulWidget {
  ProfilePratnerScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePratnerScreen> createState() => _ProfilePratnerScreenState();
}

class _ProfilePratnerScreenState extends State<ProfilePratnerScreen> {
  final GlobalKey<FormState> profileForm = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  File? _selectedFile;
  String? userImage;
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstInstall();
  }

  Future<void> _firstInstall() async {
    await context.read<AppController>().initialize();
    final user = await context.read<AppController>().user?.image;
    userImage = await user;
  }

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
            child: userImage != null
                ? Image.network(
                    userImage!,
                    fit: BoxFit.cover,
                  )
                : Center(child: CircularProgressIndicator())
            // : Image.asset(
            //     'assets/icons/user.png',
            //     fit: BoxFit.cover,
            //   ),
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
    return Consumer<AppController>(
      builder: (context, controller, child) {
        final user = context.read<AppController>().user;
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(color: Colors.blueAccent.withOpacity(0.1), blurRadius: 10, offset: Offset(0, -5)),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text(
                            'ดำเนินการเรียบร้อย',
                            //style: TextStyle(fontFamily: fontFamily),
                          ),
                          content: Text(
                            'ต้องการออกจากหน้านี้หรือไม่',
                            //style: TextStyle(fontFamily: fontFamily),
                          ),
                          actions: <CupertinoDialogAction>[
                            CupertinoDialogAction(
                              child: Text(
                                'ยกเลิก',
                                // style: TextStyle(
                                //   color: kThemeTextColor,
                                //   fontFamily: fontFamily,
                                //   fontWeight: FontWeight.bold,
                                // ),
                              ),
                              onPressed: () => Navigator.pop(context, true),
                            ),
                            CupertinoDialogAction(
                              child: Text(
                                'ตกลง',
                                // style: TextStyle(
                                //   color: kThemeTextColor,
                                //   fontFamily: fontFamily,
                                // ),
                              ),
                              onPressed: () => Navigator.of(context)
                                ..pop()
                                ..pop(),
                            )
                          ],
                        ),
                      );
                    },
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Colors.blue,
                    elevation: 0,
                    highlightElevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    child: Text("Save", style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(width: 10),
                // MaterialButton(
                //   onPressed: () {},
                //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10)),
                //   color: Colors.white.withOpacity(0.1),
                //   elevation: 0,
                //   highlightElevation: 0,
                //   hoverElevation: 0,
                //   focusElevation: 0,
                //   child: Text("Reset", style: TextStyle(color: Colors.blue)),
                // ),
              ],
            ),
          ),
          body: Form(
            key: profileForm,
            child: ListView(
              primary: true,
              children: [
                // Text("Profile details", style: TextStyle(color: Colors.white)),
                // Text("Change the following details and save them", style: TextStyle(color: Colors.white)),
                //ImageFieldWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 5,
                    runSpacing: 8,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: CircleAvatar(backgroundColor: Colors.transparent, radius: 80, child: getImageWidget()
                                // ClipOval(
                                //     child: Image.network(
                                //   user!.image!,
                                //   width: 200,
                                //   height: 200,
                                //   errorBuilder: (context, error, stackTrace) => Center(
                                //     child: Image.asset('assets/images/No_Image_Available.jpg'),
                                //   ),
                                // )),
                                ),
                          ),
                          Positioned(
                            top: 130,
                            left: 225,
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
                    ],
                  ),
                ),
                TextFieldWidget(
                  onSaved: (input) => username.text = input!,
                  validator: (input) => input!.length < 3 ? "Should be more than 3 letters" : null,
                  initialValue: username.text,
                  hintText: user!.name,
                  labelText: "Company",
                  iconData: Icons.person_outline,
                ),
                TextFieldWidget(
                  onSaved: (input) => email.text = input!,
                  validator: (input) => !input!.contains('@') ? "Should be a valid email" : null,
                  initialValue: email.text,
                  hintText: user.email,
                  labelText: "Email",
                  iconData: Icons.alternate_email,
                ),
                PhoneFieldWidget(
                    labelText: "Phone Number",
                    hintText: user.phone,
                    initialCountryCode: 'TH',
                    initialValue: phonenumber.text,
                    // onSaved: (phone) {
                    //   return controller.user.value.phoneNumber = phone.completeNumber;
                    // },
                    suffix: Text(
                      "Verified",
                      style: TextStyle(color: Colors.green),
                    )
                    // : Text(
                    //     "Not Verified".tr,
                    //     style: Get.textTheme.caption.merge(TextStyle(color: Colors.redAccent)),
                    //   ),
                    ),
                TextFieldWidget(
                  onSaved: (input) => address.text = input!,
                  validator: (input) => input!.length < 3 ? "Should be more than 3 letters" : null,
                  initialValue: address.text,
                  hintText: "123 Street, City 136, State, Country",
                  labelText: "Address",
                  iconData: Icons.map_outlined,
                ),
                // TextFieldWidget(
                //     labelText: "Password",
                //     hintText: "••••••••••••",
                //     onSaved: (input) => password.text = input!,
                //     onChanged: (input) => password.text = input,
                //     validator: (input) => input!.length > 0 && input.length < 3 ? "Should be more than 3 letters" : null,
                //     initialValue: password.text,
                //     obscureText: true,
                //     iconData: Icons.lock_outline,
                //     keyboardType: TextInputType.visiblePassword,
                //     suffixIcon: IconButton(
                //       onPressed: () {},
                //       color: Theme.of(context).focusColor,
                //       icon: Icon(Icons.visibility_outlined
                //           //Icons.visibility_off_outlined
                //           ),
                //     )),
              ],
            ),
          ),
        );
      },
    );
  }
}

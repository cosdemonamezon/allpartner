import 'package:allpartner/Screen/Allpartner/Notification/NotificationScreen.dart';
import 'package:allpartner/Screen/Allpartner/Profile/PartnerAddress.dart';
import 'package:allpartner/Screen/Allpartner/Profile/PartnerLanguage.dart';
import 'package:allpartner/Screen/Allpartner/Profile/ProfilePratnerScreen.dart';
import 'package:allpartner/Screen/Allpartner/Profile/SetAbout.dart';
import 'package:allpartner/Screen/Allpartner/Profile/SetHelp.dart';
import 'package:allpartner/Screen/Allpartner/Profile/SetPayment.dart';
import 'package:allpartner/Screen/Allpartner/Profile/Widgets/CustomButton.dart';
import 'package:allpartner/Screen/Allpartner/Profile/Widgets/ProfileMenu.dart';
import 'package:allpartner/Screen/Login/WelcomeScreen.dart';
import 'package:allpartner/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/appController.dart';
import 'VendorPage.dart';

class ProfileSettingScreen extends StatefulWidget {
  ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstInstall();
  }

  Future<void> _firstInstall() async {
    await context.read<AppController>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (context, controller, child) {
        final size = MediaQuery.of(context).size;
        final appFontSize = AppFontSize.of(context);
        final user = context.read<AppController>().user;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child: Stack(
                  children: [
                    Container(
                      height: size.height / 6,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: size.height / 6,
                          width: size.width,
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.only(left: size.height / 40, right: size.height / 40, top: size.height * 0.01),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: user!.image != null
                                    ? Container(
                                        margin: const EdgeInsets.only(right: 10),
                                        height: size.width > 700 ? 70 : 50,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(user.image!),
                                              fit: BoxFit.cover,
                                            )),
                                      )
                                    : Container(
                                        margin: const EdgeInsets.only(right: 10),
                                        height: size.width > 700 ? 70 : 50,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage('assets/icons/user.png'),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                              ),
                              Expanded(
                                flex: 9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      user.name!,
                                      style: TextStyle(
                                        fontSize: appFontSize?.body,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => ProfilePratnerScreen()));
                                      },
                                      child: Text(
                                        'แก้ไขข้อมูล',
                                        style: TextStyle(
                                          fontSize: appFontSize?.body3,
                                          color: Colors.white,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        // Divider(color: Colors.grey),
                        TitleTextWidget(title: 'บัญชีของฉัน', size: size),
                        ProfileMenu(
                          title: 'รายละเอียดบริษัท',
                          image: 'user',
                          page: VendorPage(),
                        ),
                        Divider(color: Colors.grey),
                        ProfileMenu(
                          title: 'จัดการที่อยู่',
                          image: 'mapSetting',
                          page: PartnerAddress(),
                        ),
                        Divider(color: Colors.grey),
                        ProfileMenu(
                          title: 'ภาษา',
                          image: 'translate',
                          page: PartnerLanguage(),
                        ),
                        Divider(color: Colors.grey),
                        TitleTextWidget(title: 'ตั้งค่าแอป', size: size),
                        ProfileMenu(
                          title: 'แจ้งเตือน',
                          image: 'notificationSetting',
                          page: NotificationScreen(),
                        ),
                        Divider(color: Colors.grey),
                        ProfileMenu(
                          title: 'ข้อมูลบัตรเครดิต/เดบิต',
                          image: 'wallet',
                          page: SetPayment(),
                        ),
                        Divider(color: Colors.grey),
                        TitleTextWidget(title: 'ข้อมูล', size: size),
                        ProfileMenu(
                          title: 'ช่วยเหลือ',
                          image: 'questionSetting',
                          page: SetHelp(),
                        ),
                        Divider(color: Colors.grey),
                        ProfileMenu(
                          title: 'เกี่ยวกับเรา',
                          image: 'copyright',
                          page: SetAbout(),
                        ),
                        Divider(color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 10),
            child: CustomButton(
              color: Colors.white,
              borderOnly: true,
              text: 'ออกจากระบบ',
              onPressed: () async {
                logOut(context);
              },
            ),
          ),
        );
      },
    );
  }

  logOut(context) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => WelcomeScreen(),
      ),
      (route) => false,
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({Key? key, required this.size, required this.title}) : super(key: key);

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.02),
          child: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

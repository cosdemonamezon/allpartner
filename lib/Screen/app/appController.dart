import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/user.dart';
import 'AppService.dart';

class AppController extends ChangeNotifier {
  String? token;
  SharedPreferences? pref;
  final AppService appService;

  bool? password;
  String? identifierId;
  User? user;
  String? id;

  AppController({this.appService = const AppService()});

  Future<void> initialize() async {
    // if (Platform.isAndroid) {
    //   identifierId = await AndroidId().getId();
    // } else {
    //   final iosInfo = await deviceInfo.iosInfo;
    //   identifierId = iosInfo.identifierForVendor;
    // }
    pref = await SharedPreferences.getInstance();
    token = pref?.getString('token');
    id = pref?.getString('member_id');

    user = token != null ? await appService.getProfile(token!, id!) : null;
    notifyListeners();
  }

  Future<void> logOut() async {
    pref = await SharedPreferences.getInstance();
    if (pref != null) {
      pref!.clear();
    }

    token = null;
    user = null;
    id = null;
  }
}

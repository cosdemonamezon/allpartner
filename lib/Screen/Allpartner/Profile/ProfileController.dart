import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/user.dart';
import 'ProfileService.dart';

class ProfileController extends ChangeNotifier {
  ProfileController({this.profileService = const ProfileService()});

  ProfileService profileService;
  String? token;
  SharedPreferences? pref;
  User? userVendor;

  // DetailVendor
  Future<void> vendorlUser(
    int id,
  ) async {
    userVendor = null;
    pref = await SharedPreferences.getInstance();
    token = pref?.getString('token');
    userVendor = await ProfileService.getUserVendor(userId: id);

    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/DetailVendor/detailVendor.dart';
import '../../../Model/user.dart';
import 'ProfileService.dart';

class ProfileController extends ChangeNotifier {
  ProfileController({this.profileService = const ProfileService()});

  ProfileService profileService;
  String? token;
  SharedPreferences? pref;
  User? userVendor;
  List<DetailVendor> detailScrap = [];
  List<DetailVendor> detailLogistic = [];
  List<DetailVendor> detailPurchase = [];

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

  //โหลดรายละเอียด VendorScrap
  Future<void> loadDetailVendorScrap() async {
    detailScrap.clear();
    final _loadPositionS = await ProfileService.getVendorScrap();
    detailScrap.addAll(_loadPositionS);
    // positionCompany[0].recruitment_companies!.sort((a, b) => b.id!.compareTo(a.id!));
    notifyListeners();
  }

  //โหลดรายละเอียด VendorLogistic
  Future<void> loadDetailVendorLogistic() async {
    detailLogistic.clear();
    final _loadPositionS = await ProfileService.getVendorLogistic();
    detailLogistic.addAll(_loadPositionS);
    // positionCompany[0].recruitment_companies!.sort((a, b) => b.id!.compareTo(a.id!));
    notifyListeners();
  }

  //โหลดรายละเอียด VendorPurchase
  Future<void> loadDetailVendorPurchase() async {
    detailPurchase.clear();
    final _loadPositionS = await ProfileService.getVendorPurchase();
    detailPurchase.addAll(_loadPositionS);
    // positionCompany[0].recruitment_companies!.sort((a, b) => b.id!.compareTo(a.id!));
    notifyListeners();
  }
}

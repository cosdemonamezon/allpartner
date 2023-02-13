import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/DetailVendor/detailVendor.dart';
import '../../../Model/user.dart';
import '../../../Model/venderService.dart';
import '../../../Model/vendor.dart';
import '../../../constants/constants.dart';

class ProfileService {
  const ProfileService();

  Future<Vendor?> setVendor({
    required String user_id,
    required String name,
    required String email,
    required String phone,
    required String tax,
    required String address1,
    required String address2,
    required String address3,
    required String country,
    required String postcode,
    required String fax,
    required String type,
    // required PlatformFile images,
    required List<PlatformFile> images,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final filesList = images.map((image) => MultipartFile.fromFileSync(image.path!)).toList();
    final token = pref.getString('token');
    final headers = {'Authorization': 'Bearer $token', 'Content-Type': 'multipart/form-data'};
    var formData = FormData.fromMap(
      {
        "user_id": user_id,
        "name": name,
        "email": email,
        "phone": phone,
        "tax": tax,
        "address1": address1,
        "address2": address2,
        "address3": address3,
        "country": country,
        "postcode": postcode,
        "fax": fax,
        "type": type,
        'images[]': filesList,
      },
    );
    try {
      var response = await Dio().post('$baseUrl/api/vendor', data: formData, options: Options(headers: headers));

      return Vendor.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw (e.response?.data['message']);
    }
  }

  //โหลดVendor ของUser
  static Future<User?> getUserVendor({required int userId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_vendor_by_partner/$userId');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return User.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //โหลดรายละเอียด VendorScrap
  static Future<List<DetailVendor>> getVendorScrap() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_scrap_services');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list = data['data'] as List;

      return list.map((e) => DetailVendor.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //โหลดรายละเอียด VendorLogistic
  static Future<List<DetailVendor>> getVendorLogistic() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_logistic_services');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list = data['data'] as List;

      return list.map((e) => DetailVendor.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //โหลดรายละเอียด VendorPurchase
  static Future<List<DetailVendor>> getVendorPurchase() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_purchase_services');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list = data['data'] as List;

      return list.map((e) => DetailVendor.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เพิ่มความต้องการ Vender
  Future<Vendor?> setServiceVender({
    required int vendor_id,
    required List<VenderService> services,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/vendor_services');
    final response = await http.post(url,
        body: jsonEncode({
          "vendor_id": vendor_id,
          "services": services,
        }),
        headers: {
          'Authorization': 'Bearer ${token}',
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      final responseString = jsonDecode(response.body);
      return Vendor.fromJson(responseString["data"]);
    } else {
      final responseString = jsonDecode(response.body);
      throw responseString['message'];
    }
  }

  //โหลดความต้องการ Vender
  static Future<Vendor?> getServiceVendor({required int vendorId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/vendor/$vendorId');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return Vendor.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}

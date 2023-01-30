import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/user.dart';
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
}

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/user.dart';
import '../../constants/constants.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  const RegisterService();

  // Future<User?> setInformation({
  //   required String permission_id,
  //   required String username,
  //   required String password,
  //   required String name,
  //   required String email,
  //   required String phone,
  //   required String type,
  //   required String line_token,
  //   required File image,
  // }) async {
  //   // SharedPreferences pref = await SharedPreferences.getInstance();
  //   // final token = pref.getString('token');
  //   final url = Uri.parse('$baseUrl/api/user');
  //   final response = await http.post(url,
  //       body: jsonEncode({
  //         "permission_id": permission_id,
  //         "username": username,
  //         "password": password,
  //         "name": name,
  //         "email": email,
  //         "phone": phone,
  //         "type": type,
  //         "line_token": line_token,
  //         "image": image,
  //       }),
  //       headers: {
  //         // 'Authorization': 'Bearer ${token}',
  //         'Content-Type': 'application/json',
  //       });
  //   if (response.statusCode == 200) {
  //     final responseString = jsonDecode(response.body);
  //     return User.fromJson(responseString["data"]);
  //   } else {
  //     final responseString = jsonDecode(response.body);
  //     throw responseString['message'];
  //   }
  // }

  Future<User?> setInformation({
    required String permission_id,
    required String username,
    required String password,
    required String name,
    required String email,
    required String phone,
    required String type,
    required String line_token,
    required File image,
  }) async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // final token = pref.getString('token');
    final headers = {
      // 'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data'
    };
    final formData = FormData.fromMap(
      {
        "permission_id": permission_id,
        "username": username,
        "password": password,
        "name": name,
        "email": email,
        "phone": phone,
        "type": type,
        "line_token": line_token,
        'image': await MultipartFile.fromFile(image.path),
      },
    );
    try {
      final response = await Dio().post('$baseUrl/api/user', data: formData, options: Options(headers: headers));

      return User.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw (e.response?.data['message']);
    }
  }
}

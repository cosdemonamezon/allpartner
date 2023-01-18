import 'dart:io';

import 'package:dio/dio.dart';

import '../../../Model/vendor.dart';
import '../../../constants/constants.dart';

class ProfileService {
  const ProfileService();

  Future<Vendor?> setInformation({
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

      return Vendor.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw (e.response?.data['message']);
    }
  }
}

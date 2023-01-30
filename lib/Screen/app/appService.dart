import 'dart:developer';

import '../../Model/user.dart';
import '../../constants/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AppService {
  const AppService();

  Future<User> getProfile(String token, String id) async {
    final url = Uri.parse('$baseUrl/api/get_vendor_by_partner/$id');

    final headers = {'Authorization': 'Bearer $token'};

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);

      // final meetings = data['data']['meetings'] as List;
      // final m = meetings.map((e) {
      //   e['isAccept'] = false;
      //   return e;
      // }).toList();
      return User.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}

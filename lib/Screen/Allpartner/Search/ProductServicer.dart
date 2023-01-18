import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/company/company.dart';
import '../../../Model/user.dart';
import '../../../constants/constants.dart';

class ProductService {
  const ProductService();

  // ProductCompany
  // static Future<List<User>> getProductCompany({required int companyId}) async {
  //   final pref = await SharedPreferences.getInstance();
  //   final token = pref.getString('token');
  //   final url = Uri.parse('$baseUrl/api/scrap_by_companie/$companyId');

  //   final response =
  //       await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     final list = data['data'] as List;

  //     return list.map((e) => User.fromJson(e)).toList();
  //   } else {
  //     final data = convert.jsonDecode(response.body);
  //     throw Exception(data['message']);
  //   }
  // }

// Companyทั้งหมด
  static Future<List<Company>> listCompany() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_user_company');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list = data['data'] as List;

      return list.map((e) => Company.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //โหลดLogistic ของCustomer
  static Future<List<User>> getLogisticCustomer({required int companyId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/logistic_by_companie/$companyId');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list = data['data'] as List;

      return list.map((e) => User.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //โหลดScrap ของCustomer
  static Future<List<User>> getScrapCustomer({required int companyId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/scrap_by_companie/$companyId');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list = data['data'] as List;

      return list.map((e) => User.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  // Future<UserDetailJob?> setInformationDetil({
  //   String? user_job_id,
  //   String? location_of_educate,
  //   String? major,
  //   String? degree,
  //   String? grade,
  //   String? finished,
  //   String? thai,
  //   String? english,
  //   String? china,
  //   String? japan,
  //   String? exp,
  //   String? position,
  //   String? salary,
  //   String? remark,
  // }) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   final token = pref.getString('token');
  //   final url = Uri.parse('$pathApi/api/user_job_detail');
  //   final response = await http.post(url,
  //       body: jsonEncode({
  //         "user_job_id": user_job_id,
  //         "location_of_educate": location_of_educate == "" ? '-' : location_of_educate,
  //         "major": major == "" ? '-' : major,
  //         "degree": degree,
  //         "grade": grade == "" ? '-' : grade,
  //         "finished": finished == "" ? '-' : finished,
  //         "thai": thai,
  //         "english": english,
  //         "china": china,
  //         "japan": japan,
  //         "exp": exp == "" ? '-' : exp,
  //         "position": position == "" ? '-' : position,
  //         "salary": salary == "" ? '-' : salary,
  //         "remark": remark == "" ? '-' : remark,
  //       }),
  //       headers: {
  //         'Authorization': 'Bearer ${token}',
  //         'Content-Type': 'application/json',
  //       });
  //   if (response.statusCode == 200) {
  //     final responseString = jsonDecode(response.body);
  //     return UserDetailJob.fromJson(responseString["data"]);
  //   } else {
  //     final responseString = jsonDecode(response.body);
  //     throw responseString['message'];
  //   }
  // }
}

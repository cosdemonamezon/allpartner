import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/Qoutation/quotation.dart';
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

  //โหลดPurchase ของCustomer
  static Future<List<User>> getPurchaseCustomer({required int companyId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/purchase_by_companie/$companyId');

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

// ใบเสนอราคา Sracp
  Future<Quotation?> postQuotationScrap({
    required String user_id,
    required String scrap_companie_id,
    required String remark,
    required String title,
    required PlatformFile file,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // final files = image.map((e) => MultipartFile.fromFileSync(e.path!)).toList();
    final token = pref.getString('token');
    final headers = {'Authorization': 'Bearer $token', 'Content-Type': 'multipart/form-data'};
    final formData = FormData.fromMap(
      {
        "user_id": user_id,
        "scrap_companie_id": scrap_companie_id,
        "remark": remark,
        "title": title,
        'file': MultipartFile.fromFileSync(file.path!),
      },
    );
    try {
      final response =
          await Dio().post('$baseUrl/api/scrap_quotation', data: formData, options: Options(headers: headers));

      return Quotation.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw (e.response?.data['message']);
    }
  }

// ใบเสนอราคา Logistic
  Future<Quotation?> postQuotationLogistic({
    required String user_id,
    required String logistic_companie_id,
    required String remark,
    required String title,
    required PlatformFile file,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // final files = file.map((e) => MultipartFile.fromFileSync(e.path!)).toList();
    final token = pref.getString('token');
    final headers = {'Authorization': 'Bearer $token', 'Content-Type': 'multipart/form-data'};
    final formData = FormData.fromMap(
      {
        "user_id": user_id,
        "logistic_companie_id": logistic_companie_id,
        "remark": remark,
        "title": title,
        'file': MultipartFile.fromFileSync(file.path!),
      },
    );
    try {
      final response =
          await Dio().post('$baseUrl/api/logistic_quotation', data: formData, options: Options(headers: headers));

      return Quotation.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw (e.response?.data['message']);
    }
  }

// ใบเสนอราคา Purchase
  Future<Quotation?> postQuotationPurchase({
    required String user_id,
    required String purchase_companie_id,
    required String remark,
    required String title,
    required PlatformFile file,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // final files = image.map((e) => MultipartFile.fromFileSync(e.path!)).toList();
    final token = pref.getString('token');
    final headers = {'Authorization': 'Bearer $token', 'Content-Type': 'multipart/form-data'};
    final formData = FormData.fromMap(
      {
        "user_id": user_id,
        "purchase_companie_id": purchase_companie_id,
        "remark": remark,
        "title": title,
        'file': MultipartFile.fromFileSync(file.path!),
      },
    );
    try {
      final response =
          await Dio().post('$baseUrl/api/purchase_quotation', data: formData, options: Options(headers: headers));

      return Quotation.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw (e.response?.data['message']);
    }
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //โหลดQuotatian ของPurchase
  static Future<User?> getQuotatianPurchase({required int userId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_purchase_quotation_by_parther/$userId');

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

  //โหลดQuotatian ของlogistic
  static Future<User?> getQuotatianLogistic({required int userId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_logistic_quotation_by_parther/$userId');

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

  //โหลดQuotatian ของScrap
  static Future<User?> getQuotatianScrap({required int userId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_scrap_quotation_by_parther/$userId');

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

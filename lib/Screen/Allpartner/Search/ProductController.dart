import 'package:allpartner/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/company/company.dart';
import 'ProductServicer.dart';

class ProductController extends ChangeNotifier {
  ProductController({this.productService = const ProductService()});

  ProductService productService;
  String? token;
  SharedPreferences? pref;
  // List<User> productCompany = [];
  List<Company> compayCustomer = [];
  List<User> logisticCompany = [];
  List<User> puchaseCompany = [];
  List<User> scrapCompany = [];
  ///////////
  /////โหลดQuotatian ของPurchase
  User? quotationPuchase;
  User? quotationLogistic;
  User? quotationScrap;

  // ProductCompany
  // Future<void> loadProductCompany({
  //   required int Id,
  // }) async {
  //   final _loadProduct = await ProductService.getProductCompany(companyId: Id);
  //   productCompany = (_loadProduct);

  //   notifyListeners();
  // }

// โหลดรายชื่อบริษัท
  Future<void> loadLogoCompay() async {
    compayCustomer.clear();
    final _loadItem = await ProductService.listCompany();

    // for (var company in _loadItem) {
    //   final positions = await JobService.getPosition(companyId: company.id!);
    //   inspect(positions[0].recruitment_companies);
    //   if (positions[0].recruitment_companies!.isNotEmpty) {
    //     logoCompay.add(company);
    //   }
    // }

    compayCustomer = (_loadItem);

    notifyListeners();
  }

  //โหลดLogistic ของCustomer
  Future<void> loadLogisticCompany({
    required int id,
  }) async {
    logisticCompany.clear();
    final _loadPositionL = await ProductService.getLogisticCustomer(companyId: id);
    logisticCompany.addAll(_loadPositionL);
    logisticCompany[0].logistics!.sort((a, b) => b.id!.compareTo(a.id!));
    notifyListeners();
  }

  //โหลดScrap ของCustomer
  Future<void> loadScrapCompany({
    required int id,
  }) async {
    scrapCompany.clear();
    final _loadPositionS = await ProductService.getScrapCustomer(companyId: id);
    scrapCompany.addAll(_loadPositionS);
    scrapCompany[0].scraps!.sort((a, b) => b.id!.compareTo(a.id!));

    notifyListeners();
  }

  //โหลดPuchase ของCustomer
  Future<void> loadPuchaseCompany({
    required int id,
  }) async {
    puchaseCompany.clear();
    final _loadPositionP = await ProductService.getPurchaseCustomer(companyId: id);
    puchaseCompany.addAll(_loadPositionP);
    puchaseCompany[0].puchases!.sort((a, b) => b.id!.compareTo(a.id!));
    notifyListeners();
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //โหลดQuotatian ของPurchase
  Future<void> loadQuotatianPurchase(
    int id,
  ) async {
    quotationPuchase = null;
    pref = await SharedPreferences.getInstance();
    token = pref?.getString('token');
    quotationPuchase = await ProductService.getQuotatianPurchase(userId: id);
    quotationPuchase!.qoutations!.sort((a, b) => b.id!.compareTo(a.id!));

    notifyListeners();
  }

  //โหลดQuotatian ของLogistic
  Future<void> loadQuotatianLogistic(
    int id,
  ) async {
    quotationLogistic = null;
    pref = await SharedPreferences.getInstance();
    token = pref?.getString('token');
    quotationLogistic = await ProductService.getQuotatianLogistic(userId: id);
    quotationLogistic!.qoutations!.sort((a, b) => b.id!.compareTo(a.id!));
    notifyListeners();
  }

  //โหลดQuotatian ของScrap
  Future<void> loadQuotatianScrap(
    int id,
  ) async {
    quotationScrap = null;
    pref = await SharedPreferences.getInstance();
    token = pref?.getString('token');
    quotationScrap = await ProductService.getQuotatianScrap(userId: id);
    quotationScrap!.qoutations!.sort((a, b) => b.id!.compareTo(a.id!));

    notifyListeners();
  }
}

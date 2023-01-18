import 'package:allpartner/Screen/Allpartner/Search/AddProductPartner.dart';
import 'package:allpartner/Screen/Widgets/CardList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../appTheme.dart';
import '../../Widgets/SearchTextField.dart';
import '../../app/appController.dart';
import 'DetailCompany/DetailCustomer.dart';
import 'ProductController.dart';

class SearchPartnerScreen extends StatefulWidget {
  SearchPartnerScreen({Key? key}) : super(key: key);

  @override
  State<SearchPartnerScreen> createState() => _SearchPartnerScreenState();
}

class _SearchPartnerScreenState extends State<SearchPartnerScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> productlist = [
    {
      "imgurl": "assets/images/f380d.png",
      "title": "ขายส่งเหล็กเอชบีม",
      "subtitle": "เหล็กตัวเอช, เอชบีม H-beam  เป็นเหล็กที่หน้ากว้างเท่ากัน",
      "address": "มีหลายขนาดตั้งแต่100x100 จนถึง400x400มิล",
      "total": "105.5s",
      "createAt": "2022-05-06 18:31:50.133920",
      "hh": "18:31",
      "dd": "06",
      "mm": "Feb"
    },
    {
      "imgurl": "assets/images/cd3739.png",
      "title": "ขายส่งเหล็ก นวสยามสตีล",
      "subtitle":
          "โรงงานขายเหล็กเส้น เหล็กเส้นในวงการงานก่อสร้างมักนำไปใช้สำหรับงานคอนกรีตเสริมเหล็กและงานก่ออิฐทั่วไป",
      "address": "มีเหล็กหลายขนาด เหล็กเส้นกลมSR24 เหล็กข้ออ้อย SD30, SD40, SD50",
      "total": "205.5s",
      "createAt": "2022-05-06 18:31:50.133920",
      "hh": "18:31",
      "dd": "06",
      "mm": "Feb"
    },
    {
      "imgurl": "assets/images/f380d.png",
      "title": "เหล็กฉาก สมุทรปราการ",
      "subtitle": "เหล็กฉาก สมุทรปราการ  ขายเหล็กฉากก่อสร้าง,  เหล็กราคาส่ง, เหล็กก่อสร้าง",
      "address": "สำหรับงานอุตสาหกรรม งานวิศวกรรมโรงกลึง และงานช่างกลโรงงาน ราคาถูกกว่าท้องตลาด",
      "total": "305.5s",
      "createAt": "2022-05-06 18:31:50.133920",
      "hh": "18:31",
      "dd": "06",
      "mm": "Feb"
    },
    {
      "imgurl": "assets/images/1d68.png",
      "title": "ขายส่งเหล็กตัวไอ",
      "subtitle": "ขายส่งเหล็กตัวไอ ขายส่งเหล็กไอบีมชลบุรี ขายส่งi-Beams สมุทรปราการ",
      "address": "มีบริการจัดส่งทั่วพื้นที่ เช่น สมุทรสาคร ชลบุรี ระยอง ปราจีน สระบุรี ฉะเชิงเทรา  ปทุมธานี",
      "total": "405.5s",
      "createAt": "2022-05-06 18:31:50.133920",
      "hh": "18:31",
      "dd": "06",
      "mm": "Feb"
    },
    {
      "imgurl": "assets/images/fdc4c4.png",
      "title": "เหล็กรางรถไฟ ราคาส่ง",
      "subtitle": "เหล็กรางรถไฟ  เราขายเหล็กรางรถไฟ ราคาส่ง, เหล็กรางเดินเครน, เหล็กทำถนนทำทาง ราคาส่ง",
      "address": "หล็กสำหรับงานก่อสร้าง ราคาถูกกว่าท้องตลาด  เรามีบริการจัดส่งทั่วพื้นที่",
      "total": "505.5s",
      "createAt": "2022-05-06 18:31:50.133920",
      "hh": "18:31",
      "dd": "06",
      "mm": "Feb"
    }
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadItem();
  }

  Future _loadItem() async {
    final userId = await context.read<AppController>().user!.id;
    // await context.read<ProductController>().loadProductCompany(Id: userId!);
    await context.read<ProductController>().loadLogoCompay();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appFontSize = AppFontSize.of(context);
    return Consumer<ProductController>(
      builder: (context, controller, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'รายการสินค้า',
              //style: TextStyle(color: Colors.deepOrange),
            ),
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            bottom: TabBar(
              //isScrollable: true,
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'NotoSansThai'),
              tabs: [
                Tab(text: 'รายชื่อบริษัท'),
                Tab(text: 'สินค้า'),
              ],
            ),
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
          ),
          // body:
          body: TabBarView(
            controller: _tabController,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: SearchTextField(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: controller.compayCustomer.isEmpty
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              // controller: _controller,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.compayCustomer.length,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailCustomer(
                                                    id: controller.compayCustomer[index].id!,
                                                    // name: controller.compayCustomer[index].name!,
                                                    // email: controller.compayCustomer[index].email!,
                                                    // image: controller.compayCustomer[index].image!,
                                                    // phone: controller.compayCustomer[index].phone!,
                                                  )));
                                    },
                                    child: Container(
                                      width: size.width,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/promotionBG.png'),
                                          fit: BoxFit.fill,
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(0, 2),
                                              color: Color.fromRGBO(0, 78, 179, 0.05),
                                              blurRadius: 10)
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Image.network(
                                                  "${controller.compayCustomer[index].image}",
                                                  height: size.height / 17,
                                                  errorBuilder: (context, error, stackTrace) =>
                                                      Image.asset('assets/images/No_Image_Available.jpg'),
                                                )
                                                // : Image.asset(
                                                //     'assets/images/No_Image_Available.jpg'),
                                                ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              flex: 8,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller.compayCustomer[index].name ?? '',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold, fontSize: appFontSize?.body),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      'เบอร์โทรศัพท์ ${controller.compayCustomer[index].phone ?? ''}',
                                                      style: TextStyle(fontSize: appFontSize?.body2),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(height: 4),
                                                    Text(
                                                      'อีเมลล์ ${controller.compayCustomer[index].email ?? ''} ',
                                                      style: TextStyle(fontSize: appFontSize?.body2),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(height: 4),
                                                    // Text(
                                                    //   'ลักษณะงาน ${controller.compayCustomer[index].type ?? ''}',
                                                    //   style: TextStyle(fontSize: appFontSize?.body2),
                                                    //   // overflow: TextOverflow.ellipsis,
                                                    // ),
                                                    // SizedBox(height: 4),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                    ),
                    // ListView(
                    //   scrollDirection: Axis.vertical,
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   children: companydata
                    //       .map((data) => CompaniesList(
                    //             companydata: data,
                    //             use: true,
                    //             press: () {
                    //               Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                       builder: (context) => JobCompanyScreen()));
                    //             },
                    //           ))
                    //       .toList(),
                    // )
                  ],
                ),
              ),
              //Tap2
              SingleChildScrollView(
                child: Column(
                  children: [
                    // buildSearchBar(),
                    ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: productlist
                          .map((e) => CardList(
                                list: e,
                              ))
                          .toList(),
                    ),
                    // CardList(list: productlist),
                  ],
                ),
              ),
            ],
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductPartner()));
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Hero(
      tag: 'tag',
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 0),
              child: Icon(Icons.search, color: Colors.deepOrange),
            ),
            Expanded(
              child: Material(
                color: Colors.white,
                child: TextField(
                  controller: searchController,
                  style: TextStyle(color: Colors.black),
                  onSubmitted: (value) {},
                  autofocus: false,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    hintText: 'Search for home service...',
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 4,
                  children: [
                    Text(
                      "Filter",
                      style: TextStyle(color: Colors.black), //TextStyle(color: Get.theme.hintColor),
                    ),
                    Icon(
                      Icons.filter_list,
                      color: Colors.black,
                      size: 21,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

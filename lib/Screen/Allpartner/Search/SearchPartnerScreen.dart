import 'package:allpartner/Screen/Allpartner/Search/AddProductPartner.dart';
import 'package:allpartner/Screen/Widgets/CardList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/appController.dart';
import 'ProductController.dart';

class SearchPartnerScreen extends StatefulWidget {
  SearchPartnerScreen({Key? key}) : super(key: key);

  @override
  State<SearchPartnerScreen> createState() => _SearchPartnerScreenState();
}

class _SearchPartnerScreenState extends State<SearchPartnerScreen> {
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
    _loadItem();
  }

  Future _loadItem() async {
    final userId = await context.read<AppController>().user!.id;
    print(userId);
    await context.read<ProductController>().loadProductCompany(Id: userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder: (context, controller, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'รายการสินค้า',
            //style: TextStyle(color: Colors.deepOrange),
          ),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: controller.productCompany.length,
            itemBuilder: (_, index) {
              return controller.productCompany.isNotEmpty
                  ? SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 5)),
                            ],
                            borderRadius:
                                BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                  child: controller.productCompany[0].scraps!.isNotEmpty &&
                                          controller.productCompany[0].scraps![index].image! != null
                                      ? Image.network(
                                          controller.productCompany[0].scraps![index].image!,
                                          fit: BoxFit.fill,
                                          height: 100,
                                          width: 80,
                                        )
                                      // : SizedBox.shrink()
                                      : Image.asset(
                                          "assets/images/No_Image_Available.jpg",
                                          fit: BoxFit.fill,
                                          height: 100,
                                          width: 80,
                                        ),
                                ),
                              ],
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Opacity(
                                opacity: 1,
                                child: Wrap(
                                  runSpacing: 2,
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Expanded(
                                            child: controller.productCompany[0].scraps!.isNotEmpty
                                                ? Text(
                                                    controller.productCompany[0].scraps![index].name!,
                                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                                    maxLines: 3,
                                                    // textAlign: TextAlign.end,
                                                  )
                                                : Text(
                                                    '',
                                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                                    maxLines: 3,
                                                    // textAlign: TextAlign.end,
                                                  )),
                                        // IconButton(
                                        //     onPressed: () {
                                        //       showModalBottomSheet(
                                        //         context: context,
                                        //         isScrollControlled: true,
                                        //         builder: (BuildContext context) => SizedBox(
                                        //           height: size.height * 0.90,
                                        //           child: DecoratedBox(
                                        //             decoration: BoxDecoration(
                                        //               color: Color.fromARGB(255, 221, 218, 218),
                                        //             ),
                                        //             child: Padding(
                                        //               padding: EdgeInsets.symmetric(
                                        //                   horizontal: 10, vertical: 10),
                                        //               child: Column(
                                        //                 mainAxisSize: MainAxisSize.min,
                                        //                 mainAxisAlignment:
                                        //                     MainAxisAlignment.start,
                                        //                 crossAxisAlignment:
                                        //                     CrossAxisAlignment.start,
                                        //                 children: [
                                        //                   Form(
                                        //                     key: editFormKey,
                                        //                     child: Wrap(
                                        //                       children: [
                                        //                         Padding(
                                        //                           padding: EdgeInsets.symmetric(
                                        //                               vertical: 10),
                                        //                           child: Text(
                                        //                             'หัวข้อ',
                                        //                             style: TextStyle(
                                        //                                 color: Colors.blue,
                                        //                                 fontWeight:
                                        //                                     FontWeight.bold),
                                        //                           ),
                                        //                         ),
                                        //                         AddTextForm(
                                        //                           controller: username,
                                        //                           hintText: list['title'],
                                        //                         ),
                                        //                         SizedBox(
                                        //                           height: size.height * 0.02,
                                        //                         ),
                                        //                         Padding(
                                        //                           padding: EdgeInsets.symmetric(
                                        //                               vertical: 10),
                                        //                           child: Text(
                                        //                             'รายละเอียด',
                                        //                             style: TextStyle(
                                        //                                 color: Colors.blue,
                                        //                                 fontWeight:
                                        //                                     FontWeight.bold),
                                        //                           ),
                                        //                         ),
                                        //                         AddTextForm(
                                        //                           controller: username,
                                        //                           hintText: list['subtitle'],
                                        //                           maxLines: 4,
                                        //                         ),
                                        //                         SizedBox(
                                        //                           height: size.height * 0.02,
                                        //                         ),
                                        //                         Padding(
                                        //                           padding: EdgeInsets.symmetric(
                                        //                               vertical: 10),
                                        //                           child: Text(
                                        //                             'ที่อยู่',
                                        //                             style: TextStyle(
                                        //                                 color: Colors.blue,
                                        //                                 fontWeight:
                                        //                                     FontWeight.bold),
                                        //                           ),
                                        //                         ),
                                        //                         AddTextForm(
                                        //                           controller: username,
                                        //                           hintText:list['address'],
                                        //                         ),
                                        //                         SizedBox(
                                        //                           height: size.height * 0.02,
                                        //                         ),
                                        //                         Padding(
                                        //                           padding: EdgeInsets.symmetric(
                                        //                               vertical: 30),
                                        //                           child: ButtonRounded(
                                        //                             text: 'บันทึก',
                                        //                             color: Colors.blue,
                                        //                             textColor: Colors.white,
                                        //                             onPressed: () {
                                        //                               showCupertinoDialog(
                                        //                                 context: context,
                                        //                                 builder: (context) =>
                                        //                                     CupertinoAlertDialog(
                                        //                                   title: Text(
                                        //                                     'ดำเนินการเรียบร้อย',
                                        //                                     //style: TextStyle(fontFamily: fontFamily),
                                        //                                   ),
                                        //                                   content: Text(
                                        //                                     'ต้องการออกจากหน้านี้หรือไม่',
                                        //                                     //style: TextStyle(fontFamily: fontFamily),
                                        //                                   ),
                                        //                                   actions: <
                                        //                                       CupertinoDialogAction>[
                                        //                                     CupertinoDialogAction(
                                        //                                       child: Text(
                                        //                                         'ยกเลิก',
                                        //                                         // style: TextStyle(
                                        //                                         //   color: kThemeTextColor,
                                        //                                         //   fontFamily: fontFamily,
                                        //                                         //   fontWeight: FontWeight.bold,
                                        //                                         // ),
                                        //                                       ),
                                        //                                       onPressed: () =>
                                        //                                           Navigator.pop(
                                        //                                               context,
                                        //                                               true),
                                        //                                     ),
                                        //                                     CupertinoDialogAction(
                                        //                                       child: Text(
                                        //                                         'ตกลง',
                                        //                                         // style: TextStyle(
                                        //                                         //   color: kThemeTextColor,
                                        //                                         //   fontFamily: fontFamily,
                                        //                                         // ),
                                        //                                       ),
                                        //                                       onPressed: () =>
                                        //                                           Navigator.of(
                                        //                                               context)
                                        //                                             ..pop()
                                        //                                             ..pop(),
                                        //                                     )
                                        //                                   ],
                                        //                                 ),
                                        //                               );
                                        //                             },
                                        //                           ),
                                        //                         ),
                                        //                       ],
                                        //                     ),
                                        //                   ),
                                        //                 ],
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       );
                                        //     },
                                        //     icon: Icon(Icons.edit)),
                                        //BookingOptionsPopupMenuWidget(booking: _booking),
                                      ],
                                    ),
                                    Divider(height: 8, thickness: 0),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.build_circle_outlined,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 5),
                                        Flexible(
                                            child: controller.productCompany[0].scraps!.isNotEmpty
                                                ? Text(
                                                    controller.productCompany[0].scraps![index].description!,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.fade,
                                                    softWrap: false,
                                                    style: TextStyle(fontWeight: FontWeight.w500),
                                                  )
                                                : Text(
                                                    '',
                                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                                    maxLines: 3,
                                                    // textAlign: TextAlign.end,
                                                  )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.place_outlined,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 5),
                                        Flexible(
                                            child: controller.productCompany[0].scraps!.isNotEmpty
                                                ? Text(
                                                    'จำนวน ${controller.productCompany[0].scraps![index].qty} ',
                                                    maxLines: 1,
                                                    overflow: TextOverflow.fade,
                                                    softWrap: false,
                                                    style: TextStyle(fontWeight: FontWeight.w500),
                                                  )
                                                : Text(
                                                    'จำนวน',
                                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                                    maxLines: 3,
                                                    // textAlign: TextAlign.end,
                                                  )),
                                      ],
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
            // children: [
            //   // buildSearchBar(),
            //   ListView(
            //     scrollDirection: Axis.vertical,
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     children: productlist
            //         .map((e) => CardList(
            //               list: e,
            //             ))
            //         .toList(),
            //   ),
            //   //CardList(list: productlist),
            // ],
            ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductPartner()));
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
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

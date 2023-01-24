import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../appTheme.dart';
import '../../../Widgets/SearchTextField.dart';
import '../../../app/appController.dart';
import '../ProductController.dart';
import 'Detail/DetailPurchasePage.dart';

class PurchasePage extends StatefulWidget {
  PurchasePage({super.key, this.id});
  int? id;

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> with TickerProviderStateMixin {
  late TabController _tabController;
  final _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadItem();
  }

  Future _loadItem() async {
    await context.read<ProductController>().loadPuchaseCompany(id: widget.id!);
    final user = context.read<AppController>().user;
    await context.read<ProductController>().loadQuotatianPurchase(user!.id!);
  }

  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    final size = MediaQuery.of(context).size;
    return Consumer<ProductController>(
      builder: (context, controller, child) => DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'Purchase',
                //style: TextStyle(color: Colors.deepOrange),
              ),
              bottom: TabBar(
                //isScrollable: true,
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'NotoSansThai'),
                tabs: [
                  Tab(text: 'รายการรอเสนอ'),
                  Tab(text: 'รายการรออนุมัติ'),
                  Tab(text: 'รายการอนุมัติ'),
                ],
              ),
              backgroundColor: Colors.transparent,
            ),
            body: TabBarView(controller: _tabController, children: [
              //Tap1
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
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
                      child: controller.puchaseCompany.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              // controller: _controller,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.puchaseCompany[0].puchases!.length,
                              itemBuilder: (_, index) {
                                // if (index < controller.logisticCompany.length) {
                                return controller.puchaseCompany[0].puchases![index].status == 'Finish'
                                    ? SizedBox.shrink()
                                    : Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => DetailPurchasePage(
                                                          id: controller.puchaseCompany[0].puchases![index].id,
                                                          name: controller.puchaseCompany[0].puchases![index].name,
                                                          qty: controller.puchaseCompany[0].puchases![index].qty,
                                                          description:
                                                              controller.puchaseCompany[0].puchases![index].description,
                                                          company: controller.scrapCompany[0].name,
                                                          image: controller.scrapCompany[0].image,
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
                                                  // Expanded(
                                                  //   flex: 2,
                                                  //   child: controller.logisticCompany[index].image != null
                                                  //       ? Image.network(
                                                  //           "${controller.logisticCompany[index].image}",
                                                  //           height: size.height / 17,
                                                  //           errorBuilder: (context, error, stackTrace) =>
                                                  //               Image.asset('assets/No_Image_Available.jpg'),
                                                  //         )
                                                  //       : Image.asset('assets/No_Image_Available.jpg'),
                                                  // ),
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
                                                            controller.puchaseCompany[0].puchases![index].name ?? '',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: appFontSize?.body),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text(
                                                            'รายละเอียด ${controller.puchaseCompany[0].puchases![index].description ?? ''}',
                                                            style: TextStyle(fontSize: appFontSize?.body2),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                          SizedBox(height: 4),
                                                          Text(
                                                            'จำนวน ${controller.puchaseCompany[0].puchases![index].qty ?? ''} ',
                                                            style: TextStyle(fontSize: appFontSize?.body2),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                          SizedBox(height: 4),
                                                          // Text(
                                                          //   'ลักษณะงาน ${controller.logoCompay[index].type ?? ''}',
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
                                // } else {
                                //   return Padding(
                                //     padding: const EdgeInsets.symmetric(vertical: 30),
                                //     child: Center(
                                //       child: controller.hasmore ? const CircularProgressIndicator() : const Text(''),
                                //     ),
                                //   );
                                // }
                              }),
                    ),
                  ],
                ),
              ),
              //Tap2
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
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
                      child: controller.quotationPuchase?.qoutations?.isEmpty ?? true
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              // controller: _controller,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.quotationPuchase!.qoutations!.length,
                              itemBuilder: (_, index) {
                                return controller.quotationPuchase?.qoutations?[index].status == 'Approve'
                                    ? SizedBox.shrink()
                                    : Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) => DetailScrapPage(
                                            //               id: controller.scrapCompany[0].scraps![index].id,
                                            //               name: controller.scrapCompany[0].scraps![index].name,
                                            //               qty: controller.scrapCompany[0].scraps![index].qty,
                                            //               description: controller.scrapCompany[0].scraps![index].description,
                                            //               company: controller.scrapCompany[0].name,
                                            //               image: controller.scrapCompany[0].image,
                                            //             )));
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
                                                  // Expanded(
                                                  //   flex: 2,
                                                  //   child: controller.logisticCompany[index].image != null
                                                  //       ? Image.network(
                                                  //           "${controller.logisticCompany[index].image}",
                                                  //           height: size.height / 17,
                                                  //           errorBuilder: (context, error, stackTrace) =>
                                                  //               Image.asset('assets/No_Image_Available.jpg'),
                                                  //         )
                                                  //       : Image.asset('assets/No_Image_Available.jpg'),
                                                  // ),
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
                                                            controller.quotationPuchase?.qoutations?[index].title ?? '',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: appFontSize?.body),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text(
                                                            'รายละเอียด ${controller.quotationPuchase?.qoutations?[index].remark ?? ''}',
                                                            style: TextStyle(fontSize: appFontSize?.body2),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                          SizedBox(height: 4),
                                                          // Text(
                                                          //   'จำนวน ${controller.scrapCompany[0].scraps![index].qty ?? ''} ',
                                                          //   style: TextStyle(fontSize: appFontSize?.body2),
                                                          //   overflow: TextOverflow.ellipsis,
                                                          // ),
                                                          SizedBox(height: 4),
                                                          Column(
                                                            children: [
                                                              Text('ดาวน์โหลด'),
                                                              InkWell(
                                                                  onTap: () {
                                                                    final url = controller
                                                                        .quotationPuchase?.qoutations?[index].path;

                                                                    openBrowserURL(url: url!, inApp: false);
                                                                  },
                                                                  child: Icon(
                                                                    Icons.file_open,
                                                                    size: 50,
                                                                  )),
                                                            ],
                                                          ),
                                                          // Text(
                                                          //   'ลักษณะงาน ${controller.logoCompay[index].type ?? ''}',
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
                  ],
                ),
              ),
              //Tap3
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
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
                      child: controller.quotationPuchase?.qoutations?.isEmpty ?? true
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              // controller: _controller,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.quotationPuchase!.qoutations!.length,
                              itemBuilder: (_, index) {
                                return controller.quotationPuchase?.qoutations?[index].status != 'Approve'
                                    ? SizedBox.shrink()
                                    : Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) => DetailScrapPage(
                                            //               id: controller.scrapCompany[0].scraps![index].id,
                                            //               name: controller.scrapCompany[0].scraps![index].name,
                                            //               qty: controller.scrapCompany[0].scraps![index].qty,
                                            //               description: controller.scrapCompany[0].scraps![index].description,
                                            //               company: controller.scrapCompany[0].name,
                                            //               image: controller.scrapCompany[0].image,
                                            //             )));
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
                                                  // Expanded(
                                                  //   flex: 2,
                                                  //   child: controller.logisticCompany[index].image != null
                                                  //       ? Image.network(
                                                  //           "${controller.logisticCompany[index].image}",
                                                  //           height: size.height / 17,
                                                  //           errorBuilder: (context, error, stackTrace) =>
                                                  //               Image.asset('assets/No_Image_Available.jpg'),
                                                  //         )
                                                  //       : Image.asset('assets/No_Image_Available.jpg'),
                                                  // ),
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
                                                            controller.quotationPuchase?.qoutations?[index].title ?? '',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: appFontSize?.body),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text(
                                                            'รายละเอียด ${controller.quotationPuchase?.qoutations?[index].remark ?? ''}',
                                                            style: TextStyle(fontSize: appFontSize?.body2),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                          SizedBox(height: 4),
                                                          // Text(
                                                          //   'จำนวน ${controller.scrapCompany[0].scraps![index].qty ?? ''} ',
                                                          //   style: TextStyle(fontSize: appFontSize?.body2),
                                                          //   overflow: TextOverflow.ellipsis,
                                                          // ),
                                                          SizedBox(height: 4),
                                                          Column(
                                                            children: [
                                                              Text('ดาวน์โหลด'),
                                                              InkWell(
                                                                  onTap: () {
                                                                    final url = controller
                                                                        .quotationPuchase?.qoutations?[index].path;

                                                                    openBrowserURL(url: url!, inApp: false);
                                                                  },
                                                                  child: Icon(
                                                                    Icons.file_open,
                                                                    size: 50,
                                                                  )),
                                                            ],
                                                          ),
                                                          // Text(
                                                          //   'ลักษณะงาน ${controller.logoCompay[index].type ?? ''}',
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
                  ],
                ),
              ),
            ])),
      ),
    );
  }

  Future openBrowserURL({
    required String url,
    bool inApp = false,
  }) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(
        url,
        forceSafariVC: inApp,
        forceWebView: inApp,
        enableJavaScript: true,
        enableDomStorage: true,
      );
    }
  }
}

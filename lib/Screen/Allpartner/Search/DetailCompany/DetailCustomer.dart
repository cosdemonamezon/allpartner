import 'package:allpartner/Screen/Allpartner/Search/Logistic/LogisticPage.dart';
import 'package:allpartner/Screen/Allpartner/Search/Scrap/ScrapPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../appTheme.dart';
import '../../../Widgets/SearchTextField.dart';
import '../ProductController.dart';
import '../Purchase/PurchasePage.dart';

class DetailCustomer extends StatefulWidget {
  const DetailCustomer({super.key, required this.id});
  final int id;

  @override
  State<DetailCustomer> createState() => _DetailCustomerState();
}

class _DetailCustomerState extends State<DetailCustomer> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
    _loadItem();
  }

  Future _loadItem() async {
    await context.read<ProductController>().loadLogisticCompany(id: widget.id);
    await context.read<ProductController>().loadScrapCompany(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    final size = MediaQuery.of(context).size;
    return Consumer<ProductController>(
      builder: (context, controller, child) => DefaultTabController(
        length: 1,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'รายละเอียด',
                //style: TextStyle(color: Colors.deepOrange),
              ),
              backgroundColor: Colors.transparent,
              bottom: TabBar(
                //isScrollable: true,
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'NotoSansThai'),
                tabs: [
                  Tab(text: 'บริการ'),
                  // Tab(text: 'ใบเสนอราคา'),
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                // Tap1
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 10),
                      //   child: SearchTextField(),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return LogisticPage(id: widget.id);
                            }));
                          },
                          child: Container(
                            width: size.width,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/promotionBG.png'),
                                fit: BoxFit.fill,
                              ),
                              boxShadow: const [
                                BoxShadow(offset: Offset(0, 2), color: Color.fromRGBO(0, 78, 179, 0.05), blurRadius: 10)
                              ],
                            ),
                            child: Center(
                              child: SizedBox(
                                child: Text(
                                  'Logistic',
                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ScrapPage(id: widget.id);
                            }));
                          },
                          child: Container(
                            width: size.width,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/promotionBG.png'),
                                fit: BoxFit.fill,
                              ),
                              boxShadow: const [
                                BoxShadow(offset: Offset(0, 2), color: Color.fromRGBO(0, 78, 179, 0.05), blurRadius: 10)
                              ],
                            ),
                            child: Center(
                              child: SizedBox(
                                child: Text(
                                  'Scrap',
                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return PurchasePage(id: widget.id);
                            }));
                          },
                          child: Container(
                            width: size.width,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/promotionBG.png'),
                                fit: BoxFit.fill,
                              ),
                              boxShadow: const [
                                BoxShadow(offset: Offset(0, 2), color: Color.fromRGBO(0, 78, 179, 0.05), blurRadius: 10)
                              ],
                            ),
                            child: Center(
                              child: SizedBox(
                                child: Text(
                                  'Purchase',
                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Tap2
                // SingleChildScrollView(
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         height: 10,
                //       ),
                //       Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 10),
                //         child: SearchTextField(),
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //     ],
                //   ),
                // )
              ],
            )),
      ),
    );
  }
}

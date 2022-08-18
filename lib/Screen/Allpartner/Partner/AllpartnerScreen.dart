
import 'package:allpartner/Screen/Allpartner/Partner/Widgets/CarouselWidget.dart';
import 'package:allpartner/Screen/Allpartner/Partner/Widgets/RecommendedCarouselWidget.dart';
import 'package:allpartner/Screen/Allpartner/Partner/Widgets/SlideItemWidget.dart';
import 'package:allpartner/Screen/Widgets/HomeSearchBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AllPartnerScreen extends StatefulWidget {
  AllPartnerScreen({Key? key}) : super(key: key);

  @override
  State<AllPartnerScreen> createState() => _AllPartnerScreenState();
}

class _AllPartnerScreenState extends State<AllPartnerScreen> {
  List slide = ['assets/images/24.png'];
  List<Map<String, dynamic>> partner = [
    {'name': 'Promotion Product 1', 'img': 'assets/icons/ALLZOfficeWhite.png'},
    {'name': 'Promotion Product 2', 'img': 'assets/icons/ALLZOfficeWhite.png'},
    {'name': 'Promotion Product 3', 'img': 'assets/icons/ALLZOfficeWhite.png'},
    {'name': 'Promotion Product 4', 'img': 'assets/icons/ALLZOfficeWhite.png'}
  ];

  List<Map<String, dynamic>> recommendpartner = [
    {'name': 'Thai Partner Product', 'img': 'assets/images/image26.png', 'price':'100', 'old':'200'},
    {'name': 'Internation Partner Product', 'img': 'assets/images/image27.png', 'price':'350', 'old':'120'},
    {'name': 'Thai Partner Service', 'img': 'assets/images/image28.png', 'price':'480', 'old':'50'},
    {'name': 'Customer Service', 'img': 'assets/images/images25.png', 'price':'150', 'old':'150'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            // Get.find<LaravelApiClient>().forceRefresh();
            // await controller.refreshHome(showMessage: true);
            // Get.find<LaravelApiClient>().unForceRefresh();
          },
          child: CustomScrollView(
            primary: true,
            shrinkWrap: false,
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: 300,
                elevation: 0.5,
                floating: true,
                iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
                title: Text(
                  'All Partner',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: Icon(Icons.sort, color: Colors.black87),
                  onPressed: () {},
                ),
                //actions: [NotificationsButtonWidget()],
                bottom: HomeSearchBar(),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 7),
                          height: 360,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {},
                        ),
                        items: slide.map((i) {
                          return SlideItemWidget(slide: i);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Wrap(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text("Member Partner",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          MaterialButton(
                            onPressed: () {},
                            shape: StadiumBorder(),
                            color: Color.fromARGB(255, 17, 95, 81)
                                .withOpacity(0.1),
                            elevation: 0,
                            child: Text("ดูเพิ่ม",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                    CarouselWidget(
                      partner: partner,
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(child: Text("ข่าวสาร", style: TextStyle(fontWeight: FontWeight.w700))),
                          MaterialButton(
                            onPressed: () {
                              
                            },
                            shape: StadiumBorder(),
                            color: Colors.greenAccent.withOpacity(0.1),
                            elevation: 0,
                            child: Text("ดูเพิ่ม", style: TextStyle(fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                    ),
                    RecommendedCarouselWidget(
                      recommendpartner: recommendpartner,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

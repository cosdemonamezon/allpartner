import 'package:allpartner/Screen/Allpartner/About/AboutScreen.dart';
import 'package:allpartner/Screen/Allpartner/Order/PurchaseOrder.dart';
import 'package:allpartner/Screen/Allpartner/Partner/AllpartnerScreen.dart';
import 'package:allpartner/Screen/Allpartner/Profile/ProfileSettingScreen.dart';
import 'package:allpartner/Screen/Allpartner/Search/SearchPartnerScreen.dart';
import 'package:flutter/material.dart';

class AllPartnerHome extends StatefulWidget {
  AllPartnerHome({Key? key}) : super(key: key);

  @override
  State<AllPartnerHome> createState() => _AllPartnerHomeState();
}

class _AllPartnerHomeState extends State<AllPartnerHome> {
  int selectedIndex = 0;
  final PageController controller = PageController();

  Future<void> _onItemTapped(int index) async {
    setState(() {
      selectedIndex = index;
      controller.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          AllPartnerScreen(),
          SearchPartnerScreen(),
          PurchaseOrder(),
          AboutScreen(),
          ProfileSettingScreen(),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Container(
          height: 100,
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/navi1.png', height: size.height * 0.025),
                activeIcon: Image.asset('assets/icons/navi1_active.png', height: size.height * 0.025),
                label: 'บริการ',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/navi3.png', height: size.height * 0.025),
                activeIcon: Image.asset('assets/icons/navi3_active.png', height: size.height * 0.025),
                label: 'สินค้า',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/navi4.png', height: size.height * 0.025),
                activeIcon: Image.asset('assets/icons/navi4_active.png', height: size.height * 0.025),
                label: 'คำสั่งซื้อ',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/navi3.png', height: size.height * 0.025),
                activeIcon: Image.asset('assets/icons/navi3_active.png', height: size.height * 0.025),
                label: 'เกี่ยวกับบริษัท',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/navi5.png', height: size.height * 0.025),
                activeIcon: Image.asset('assets/icons/navi5_active.png', height: size.height * 0.025),
                label: 'ตั้งค่า',
              ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.white,
            backgroundColor: Colors.blue,
            unselectedItemColor: Colors.white,
            selectedLabelStyle: TextStyle(color: Colors.white),
            unselectedLabelStyle: TextStyle(color: Colors.white),
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

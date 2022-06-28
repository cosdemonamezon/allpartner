import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFEDFBFA);
const kThemeTextColor = Color(0xFF00B9AB);
const ktextBottomSheetColor = Color.fromRGBO(0, 185, 171, 1);
const kTabTwoColor = Color(0xFF00B9AB);
const kDisableColor = Color(0xFFB0BBC9);
const kLoginColor = Color(0xFFE4F7F6);
const kLogin2Color = Color(0xFFA7EBE7);


const EdgeInsets kDefaultHorizonPadding = EdgeInsets.symmetric(horizontal: 21);
bool isPhone(BuildContext context) => MediaQuery.of(context).size.shortestSide < 550;

SizedBox kDefaultHSpacing(BuildContext context) {
  final isPhone = MediaQuery.of(context).size.shortestSide < 550;
  return SizedBox(height: isPhone ? 8 : 18);
}

SizedBox kDefaultWSpacing(BuildContext context) {
  final isPhone = MediaQuery.of(context).size.shortestSide < 550;
  return SizedBox(width: isPhone ? 8 : 18);
}

SizedBox kLargeHSpacing(BuildContext context) {
  final isPhone = MediaQuery.of(context).size.shortestSide < 550;
  return SizedBox(height: isPhone ? 14 : 24);
}

SizedBox kLargeWSpacing(BuildContext context) {
  final isPhone = MediaQuery.of(context).size.shortestSide < 550;
  return SizedBox(width: isPhone ? 14 : 24);
}

SizedBox kHugeHSpaceing(BuildContext context) {
  final isPhone = MediaQuery.of(context).size.shortestSide < 550;
  return SizedBox(height: isPhone ? 36 : 46);
}

SizedBox kHugeWSpaceing(BuildContext context) {
  final isPhone = MediaQuery.of(context).size.shortestSide < 550;
  return SizedBox(width: isPhone ? 36 : 46);
}

const double kDefaultTabletMaxWidth = 880;

const List jobCom = [
  {
      "title": "วิศัยทัศน์.",
      "imageUrl": "assets/icons/amazon.png",
      "rating": "4.8",
      "location": "วันที่ 07 มิถุนายน 2022",
      "vacancy": "1 Vacancy"
    },
    {
      "title": "กิจกรรม",
      "imageUrl": "assets/icons/bankofamerica.png",
      "rating": "4.3",
      "location": "วันที่ 07 มิถุนายน 2022",
      "vacancy": "3 Vacancy"
    },
];

const String comData = 'บริษัท ซีพี ออลล์ จำกัด (มหาชน) ก่อตั้งขึ้นเมื่อปี 2531 โดยบริษัทในกลุ่มเครือเจริญโภคภัณฑ์ ประกอบธุรกิจหลัก คือ ธุรกิจวิทยาลัยอาชีวศึกษาด้านค้าปลีก และสถาบันการศึกษาด้านการจัดการ (บริษัท ศึกษาภิวัฒน์ จำกัด) และธุรกิจการจัดฝึกอบรม การจัดการสัมมนาทางวิชาการทางธุรกิจ (บริษัท ปัญญธารา จำกัด และบริษัท ออลล์ เทรนนิ่ง จำกัด)  บริษัทได้เข้าซื้อกิจการของ บริษัท สยามแม็คโคร จำกัด (มหาชน) ';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("ข่าวสารและเอกสารเผยแพร่"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: size.height * 0.2,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/image27.png',
                      fit: BoxFit.fill,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "ชี้แจงข่าวหรือข้อมูลตามที่ตลาดหลักทรัพย์ฯ สอบถาม (เพิ่มเติม)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "สารสนเทศฉบับนี้จัดทำและเผยแพร่โดยบริษัทจดทะเบียนและบริษัทผู้ออกหลักทรัพย์ผ่านระบบอิเล็กทรอนิกส์ ซึ่งมีวัตถุประสงค์เพื่อการเผยแพร่ข้อมูลหรือเอกสารใดๆของบริษัทจดทะเบียนและบริษัทผู้ออกหลักทรัพย์ต่อตลาดหลักทรัพย์แห่งประเทศไทยเท่านั้น ตลาดหลักทรัพย์แห่งประเทศไทยไม่มีความรับผิดชอบใดๆในความถูกต้องและครบถ้วนของเนื้อหา ตัวเลข รายงานหรือข้อคิดเห็นใดๆ ที่ปรากฎในสารสนเทศฉบับนี้และไม่มีความรับผิดในความสูญเสียหรือเสียหายใดๆ ที่อาจเกิดขึ้นไม่ว่าในกรณีใด ในกรณีที่ท่านมีข้อสงสัยหรือต้องการรายละเอียดเพิ่มเติม โปรดติดต่อบริษัทจดทะเบียนและบริษัทผู้ออกหลักทรัพย์ซึ่งได้จัดทำและเผยแพร่สารสนเทศฉบับนี้",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

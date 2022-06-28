import 'package:flutter/material.dart';

class VisionScreen extends StatefulWidget {
  VisionScreen({Key? key}) : super(key: key);

  @override
  State<VisionScreen> createState() => _VisionScreenState();
}

class _VisionScreenState extends State<VisionScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("วิสัยทัศน์และพันธกิจ"),
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
                  "มุ่งมั่นสร้างคุณค่าและการเติบโตอย่างยั่งยืน",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "สร้างการเติบโตที่ยั่งยืนผ่านธุรกิจที่มีศักยภาพ สร้างประสบการณ์ที่มีคุณค่าและมาตรฐานคุณภาพที่ดีที่สุด สร้างองค์กรที่มีความคล่องตัวสูง ตอบสนองต่อโอกาสในอนาคต สร้างคุณค่าที่ยั่งยืนให้กับธุรกิจ และผู้มีส่วนได้เสียทุกกลุ่ม ",
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
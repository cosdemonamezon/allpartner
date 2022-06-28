import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("กิจกรรม"),
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
                  "อาชาเทค อาสา ดีที่สุด คือการให้ที่ไม่สิ้นสุด",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "เครือข่ายและกิจกรรม รู้จักกับเครือข่ายพันธมิตรของอาชาเทค และกิจกรรมดีๆ ที่เราร่วมกันสร้างทั้งในและต่างประเทศ ทั้งการช่วยเหลือสังคม การดูแลสิ่งแวดล้อม และการพัฒนาความรู้ของพวกเราให้สามารถสร้างประโยชน์คืนสู่สังคมได้อย่างเต็มที่อยู่เสมอแม้ภารกิจใหญ่แต่ละครั้งจะมาพร้อมกับอุปสรรคหลายรูปแบบ ทั้งระยะทางไกล เส้นทางยากลำบาก หรืองานที่เหน็ดเหนื่อย บางครั้งก็ดูแทบจะเกินขีดความสามารถ แต่ทุกความพยายามคุ้มค่าเสมอ จากการได้เห็นรอยยิ้มของผู้คน เห็นสังคมที่ดีขึ้น และการได้ยินเสียงใครสักคนบอกว่าภารกิจนี้เป็นแรงบันดาลใจให้เขาลุกขึ้นมาทำเพื่อผู้อื่นเช่นกัน",
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
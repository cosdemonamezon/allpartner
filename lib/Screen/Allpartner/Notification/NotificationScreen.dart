

import 'package:allpartner/Screen/Allpartner/Notification/Widgets/CardNotification.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> noti = [
    {
      "title": "แจ้งเตือน ทดสอบครั้งที่ 1",
      "subtitle": "ทดสอบการแจ้งเตือนข้อมูลจากระบบ"
    },
    {
      "title": "แจ้งเตือน ทดสอบครั้งที่ 2",
      "subtitle": "ทดสอบการแจ้งเตือนข้อมูลจากระบบ"
    },
    {
      "title": "แจ้งเตือน ทดสอบครั้งที่ 3",
      "subtitle": "ทดสอบการแจ้งเตือนข้อมูลจากระบบ"
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: noti.length,
                  itemBuilder: (BuildContext context, int i){
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Container(
                        color: Colors.grey[200],
                        child: CardNotification(notidata: noti[i],)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

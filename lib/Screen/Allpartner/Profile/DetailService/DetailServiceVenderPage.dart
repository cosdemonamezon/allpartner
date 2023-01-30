import 'package:allpartner/Screen/Allpartner/Profile/DetailService/AddDetailServiceVenderPage.dart';
import 'package:flutter/material.dart';

import '../../../../appTheme.dart';

class DetailServiceVenderPage extends StatefulWidget {
  const DetailServiceVenderPage({super.key});

  @override
  State<DetailServiceVenderPage> createState() => _DetailServiceVenderPageState();
}

class _DetailServiceVenderPageState extends State<DetailServiceVenderPage> {
  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'รายละเอียดบริการ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: size.height * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddDetailServiceVenderPage()));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: size.height * 0.05,
                      width: size.width * 0.20,
                      //color: Colors.red,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Center(
                          child: Text(
                        'เพิ่มรายการ',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 3,
          ),
        ],
      ),
    );
  }
}

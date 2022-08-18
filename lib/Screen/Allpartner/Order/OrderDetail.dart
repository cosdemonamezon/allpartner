import 'package:allpartner/Screen/Allpartner/Order/UploadFile.dart';
import 'package:allpartner/Screen/Allpartner/Order/Widgets/RecordTexForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('คำขอใบเสนอราคา'),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xFFF3F3F3),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [Text('บริษัท อาชาเทค A จำกัด')],
                      ),
                      Row(
                        children: [
                          Text('ที่อยู่:'),
                          Expanded(
                              child: Text(
                            ' ถนน ลาดกระบัง เขตลาดกระบัง กรุงเทพมหานคร',
                            overflow: TextOverflow.ellipsis,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Text('ผูเติดต่อ:'),
                          Expanded(
                              child: Text(
                            ' ธวัชชัย มุ้งภูเขียว',
                            overflow: TextOverflow.ellipsis,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Text('โทร:'),
                          Expanded(
                              child: Text(
                            ' 0922568261',
                            overflow: TextOverflow.ellipsis,
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xFFF3F3F3),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [Text('ความต้องการสินค้า')],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1 . เหล็กเส้น'),
                          Text('100 ชิ้น.'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('2 . ทรายละเอียด'),
                          Text('200 กิโล.'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('3 . คอมพิวเตอร์สำนักงาน'),
                          Text('20 ชุด.'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('4 . เครื่องเจาะผนังกำแพง'),
                          Text('2 ตัว.'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('5 . หินละเอียด และปูน'),
                          Text('25 กิโล.'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('6 . ฟิมล์กรองแสงสำหรับติดกระจก'),
                          Text('250 เมตร.'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.01),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UploadFile()));
                      },
                      child: Container(
                        height: size.height * 0.06,
                        width: size.width * 0.32,
                        //color: Colors.red,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                            child: Text(
                          'รับ',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.01),
                    child: InkWell(
                      onTap: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: Text(
                              'ระบุเหตุผลที่ไม่รับ',
                              //style: TextStyle(fontFamily: fontFamily),
                            ),
                            content: CupertinoTextField(
                              maxLines: 4,
                            ),
                            actions: <CupertinoDialogAction>[
                              CupertinoDialogAction(
                                child: Text(
                                  'ยกเลิก',
                                  // style: TextStyle(
                                  //   color: kThemeTextColor,
                                  //   fontFamily: fontFamily,
                                  //   fontWeight: FontWeight.bold,
                                  // ),
                                ),
                                onPressed: () => Navigator.pop(context, true),
                              ),
                              CupertinoDialogAction(
                                child: Text(
                                  'ตกลง',
                                  // style: TextStyle(
                                  //   color: kThemeTextColor,
                                  //   fontFamily: fontFamily,
                                  // ),
                                ),
                                onPressed: () => Navigator.of(context)
                                  ..pop()
                                  ..pop(),
                              )
                            ],
                          ),
                        );
                      },
                      child: Container(
                        height: size.height * 0.06,
                        width: size.width * 0.32,
                        //color: Colors.red,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                            child: Text(
                          'ไม่รับ',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.33,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

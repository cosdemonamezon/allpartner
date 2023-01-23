import 'package:allpartner/Screen/Allpartner/Order/OrderDetail.dart';
import 'package:flutter/material.dart';

class PurchaseOrder extends StatefulWidget {
  PurchaseOrder({Key? key}) : super(key: key);

  @override
  State<PurchaseOrder> createState() => _PurchaseOrderState();
}

class _PurchaseOrderState extends State<PurchaseOrder> {
  List<Map<String, dynamic>> comtlist = [
    {
      "title": "บริษัท อาชาเทค A",
      "subtitle": "เสนอราคาเหล็กเเท่งอลูมิเนียม",
    },
    {
      "title": "บริษัท อาชาเทค B",
      "subtitle": "เสนอราคาเหล็กเส้น",
    },
    {
      "title": "บริษัท อาชาเทค C",
      "subtitle": "เสนอราคาทรายเม็ด",
    },
    {
      "title": "บริษัท อาชาเทค D",
      "subtitle": "เสนอราคาท่อ พีวีซี",
    },
    {
      "title": "บริษัท อาชาเทค E",
      "subtitle": "เสนอราคากระเบื้องมุงหลังคา",
    },
    {
      "title": "บริษัท อาชาเทค F",
      "subtitle": "เสนอราคาปูนฉาบ ตราเสือ",
    },
    {
      "title": "บริษัท อาชาเทค G",
      "subtitle": "เสนอราคาชุดอุปกรณ์ภายในสำนักงาน",
    },
    {
      "title": "บริษัท อาชาเทค H",
      "subtitle": "เสนอราคาคอมพิวเตอร์ และอุปกรณ์อิเล็กทรอนิค",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('คำขอใบเสนอราคา'),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                children: List.generate(
                    comtlist.length,
                    (index) => Column(
                          children: [
                            ListTile(
                              title: Text(comtlist[index]['title']),
                              subtitle: Text(
                                '${index + 1}.' '${comtlist[index]['subtitle']}',
                                style: TextStyle(fontSize: 15),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetail()));
                                },
                                child: Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.08,
                                  color: Colors.blueAccent,
                                  child: Center(
                                      child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        )),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

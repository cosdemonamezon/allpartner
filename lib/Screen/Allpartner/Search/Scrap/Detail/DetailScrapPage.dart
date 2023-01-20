import 'dart:developer';

import 'package:flutter/material.dart';

import '../../Quotation/QuotationPage.dart';

class DetailScrapPage extends StatefulWidget {
  DetailScrapPage({super.key, this.name, this.qty, this.description, this.company, this.image, this.id});
  String? name;
  String? qty;
  String? description;
  String? company;
  String? image;
  int? id;

  @override
  State<DetailScrapPage> createState() => _DetailScrapPageState();
}

class _DetailScrapPageState extends State<DetailScrapPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'รายละเอียด',
          //style: TextStyle(color: Colors.deepOrange),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue.withOpacity(1), Colors.blueAccent.withOpacity(0.1)],
                    begin: AlignmentDirectional.topStart,
                    //const FractionalOffset(1, 0),
                    end: AlignmentDirectional.bottomEnd,
                    stops: [0.1, 0.9],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        child: ClipOval(
                          child: Image.network(
                            widget.image!,
                            width: 65,
                            height: 55,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Text(
                        widget.company!,
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    widget.name!,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'คำอธิบาย: ${widget.description!}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  // Text(
                  //   'ประเภทของรถ: ${widget.transportType!}',
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.02,
                  // ),
                  Text(
                    'จำนวน: ${widget.qty!} ชิ้น',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  // Text(
                  //   'น้ำหนัก: ${widget.weight!}',
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //   ),
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  // Text(
                  //   'ความกว้าง: ${widget.width!}',
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //   ),
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  // Text(
                  //   'ความสูง: ${widget.height!}',
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //   ),
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          BottomAppBar(
            clipBehavior: Clip.hardEdge,
            //shape: CircularNotchedRectangle(),
            elevation: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return QuotationPage(
                          page: 'Scrap',
                          companieId: widget.id!,
                        );
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.32,
                      //color: Colors.red,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Center(
                          child: Text(
                        'เสนอราคา',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

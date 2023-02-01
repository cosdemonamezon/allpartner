import 'package:allpartner/extension/dateExtension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Model/imagesCpmpanie/imagesPurchase.dart';
import '../../Quotation/QuotationPage.dart';

class DetailPurchasePage extends StatefulWidget {
  DetailPurchasePage({
    super.key,
    this.id,
    this.name,
    this.qty,
    this.description,
    this.company,
    this.image,
    this.images,
    required this.start,
    required this.end,
  });
  int? id;
  String? name;
  String? qty;
  String? description;
  String? company;
  String? image;
  List<ImagesPurchase>? images;
  final DateTime start;
  final String end;

  @override
  State<DetailPurchasePage> createState() => _DetailPurchasePageState();
}

class _DetailPurchasePageState extends State<DetailPurchasePage> {
  late CountdownTimerController controller;
  // late int endTime = DateTime.now().millisecondsSinceEpoch + Duration(hours: int.parse(widget.end)).inMilliseconds;
  late int endTime = widget.start.millisecondsSinceEpoch + Duration(hours: int.parse(widget.end)).inMilliseconds;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
    print(widget.id);
  }

  void onEnd() {
    print('onEnd');
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.blueAccent.withOpacity(0.1),
                          Colors.blue.withOpacity(1),
                        ],
                        begin: AlignmentDirectional.topStart,
                        //const FractionalOffset(1, 0),
                        end: AlignmentDirectional.bottomEnd,
                        stops: [0.1, 0.9],
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'เวลาในการยืนใบเสนอราคา',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      CountdownTimer(
                        controller: controller,
                        widgetBuilder: (_, CurrentRemainingTime? time) {
                          if (time == null) {
                            return Text('หมดเวลาในการยืน');
                          }
                          return Text(
                            'วัน: ${time.days ?? '-'}  ชั่วโมง: ${time.hours ?? '-'}  นาที: ${time.min ?? '-'}  วินาที: ${time.sec ?? '-'} ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          );
                        },
                        // endWidget: Text('หมดเวลาในการยืน'),
                        textStyle: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                        onEnd: onEnd,
                        endTime: endTime,
                      ),
                    ],
                  ),
                ),
              ),
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

                      widget.images!.isEmpty
                          ? SizedBox.shrink()
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              // controller: _controller,
                              padding: EdgeInsets.all(15),
                              scrollDirection: Axis.vertical,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: widget.images!.length,
                              itemBuilder: (context, index) {
                                return widget.images![index].image != null
                                    ? InkWell(
                                        onTap: () {
                                          final url = widget.images![index].image;

                                          openBrowserURL(url: url!, inApp: false);
                                        },
                                        child: Image.network(widget.images![index].image!))
                                    : Image.asset('assets/images/No_Image_Available.jpg');
                              }),
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
              CountdownTimer(
                controller: controller,
                widgetBuilder: (_, CurrentRemainingTime? time) {
                  if (time == null) {
                    return SizedBox.shrink();
                  }
                  return BottomAppBar(
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
                                  page: 'Purchase',
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future openBrowserURL({
    required String url,
    bool inApp = false,
  }) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(
        url,
        forceSafariVC: inApp,
        forceWebView: inApp,
        enableJavaScript: true,
        enableDomStorage: true,
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:provider/provider.dart';

import '../../../../../appTheme.dart';
import '../../../../Widgets/SearchTextField.dart';
import '../../ProductController.dart';
import '../Detail/DetailPurchasePage.dart';

class DetailPurchasePage2 extends StatefulWidget {
  const DetailPurchasePage2({super.key, required this.id});
  final int id;
  @override
  State<DetailPurchasePage2> createState() => _DetailPurchasePage2State();
}

class _DetailPurchasePage2State extends State<DetailPurchasePage2> {
  late CountdownTimerController _controller;
  @override
  void initState() {
    super.initState();
    _loadItem();
  }

  Future _loadItem() async {
    await context.read<ProductController>().loadPuchaseCompany(id: widget.id);
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    final size = MediaQuery.of(context).size;
    return Consumer<ProductController>(
      builder: (context, controller, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'รายละเอียด',
            //style: TextStyle(color: Colors.deepOrange),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SearchTextField(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: controller.puchaseCompany.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        // controller: _controller,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.puchaseCompany[0].puchases!.length,
                        itemBuilder: (_, index) {
                          final start = controller.puchaseCompany[0].puchases?[index].created_at;
                          final end = controller.puchaseCompany[0].puchases?[index].expire_hour ?? '0';
                          late int endTime =
                              start!.millisecondsSinceEpoch + Duration(hours: int.parse(end)).inMilliseconds;
                          _controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
                          // if (index < controller.logisticCompany.length) {
                          return CountdownTimer(
                              controller: _controller,
                              widgetBuilder: (_, CurrentRemainingTime? time) {
                                if (time == null) {
                                  return SizedBox.shrink();
                                }
                                return controller.puchaseCompany[0].puchases![index].status == 'Finish'
                                    ? SizedBox.shrink()
                                    : Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => DetailPurchasePage(
                                                          id: controller.puchaseCompany[0].puchases![index].id,
                                                          name: controller.puchaseCompany[0].puchases![index].name,
                                                          qty: controller.puchaseCompany[0].puchases![index].qty,
                                                          description:
                                                              controller.puchaseCompany[0].puchases![index].description,
                                                          company: controller.puchaseCompany[0].name,
                                                          image: controller.puchaseCompany[0].image,
                                                          images: controller.puchaseCompany[0].puchases![index].images,
                                                          services:
                                                              controller.puchaseCompany[0].puchases![index].services,
                                                          end: controller
                                                              .puchaseCompany[0].puchases![index].expire_hour!,
                                                          start:
                                                              controller.puchaseCompany[0].puchases![index].created_at!,
                                                        )));
                                          },
                                          child: Container(
                                            width: size.width,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('assets/images/promotionBG.png'),
                                                fit: BoxFit.fill,
                                              ),
                                              boxShadow: const [
                                                BoxShadow(
                                                    offset: Offset(0, 2),
                                                    color: Color.fromRGBO(0, 78, 179, 0.05),
                                                    blurRadius: 10)
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                              child: Row(
                                                children: [
                                                  // Expanded(
                                                  //   flex: 2,
                                                  //   child: controller.logisticCompany[index].image != null
                                                  //       ? Image.network(
                                                  //           "${controller.logisticCompany[index].image}",
                                                  //           height: size.height / 17,
                                                  //           errorBuilder: (context, error, stackTrace) =>
                                                  //               Image.asset('assets/No_Image_Available.jpg'),
                                                  //         )
                                                  //       : Image.asset('assets/No_Image_Available.jpg'),
                                                  // ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    flex: 8,
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            controller.puchaseCompany[0].puchases![index].name ?? '',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: appFontSize?.body),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text(
                                                            'รายละเอียด ${controller.puchaseCompany[0].puchases![index].description ?? ''}',
                                                            style: TextStyle(fontSize: appFontSize?.body2),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                          SizedBox(height: 4),
                                                          Text(
                                                            'จำนวน ${controller.puchaseCompany[0].puchases![index].qty ?? ''} ',
                                                            style: TextStyle(fontSize: appFontSize?.body2),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                          SizedBox(height: 4),
                                                          // Text(
                                                          //   'ลักษณะงาน ${controller.logoCompay[index].type ?? ''}',
                                                          //   style: TextStyle(fontSize: appFontSize?.body2),
                                                          //   // overflow: TextOverflow.ellipsis,
                                                          // ),
                                                          // SizedBox(height: 4),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                              });

                          // } else {
                          //   return Padding(
                          //     padding: const EdgeInsets.symmetric(vertical: 30),
                          //     child: Center(
                          //       child: controller.hasmore ? const CircularProgressIndicator() : const Text(''),
                          //     ),
                          //   );
                          // }
                        }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

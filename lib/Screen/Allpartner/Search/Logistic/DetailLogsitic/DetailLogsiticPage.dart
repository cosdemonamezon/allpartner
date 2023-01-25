import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../appTheme.dart';
import '../../../../Widgets/SearchTextField.dart';
import '../../ProductController.dart';
import '../Detail/DetailLogisticPage.dart';

class DetailLogsiticPage2 extends StatefulWidget {
  const DetailLogsiticPage2({super.key, required this.id});
  final int id;
  @override
  State<DetailLogsiticPage2> createState() => _DetailLogsiticPage2State();
}

class _DetailLogsiticPage2State extends State<DetailLogsiticPage2> {
  @override
  void initState() {
    super.initState();
    _loadItem();
  }

  Future _loadItem() async {
    await context.read<ProductController>().loadLogisticCompany(id: widget.id);
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
                child: controller.logisticCompany.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        // controller: _controller,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.logisticCompany[0].logistics!.length,
                        itemBuilder: (_, index) {
                          // if (index < controller.logisticCompany.length) {
                          return controller.logisticCompany[0].logistics![index].status == 'Finish'
                              ? SizedBox.shrink()
                              : Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailLogisticPage(
                                                    id: controller.logisticCompany[0].logistics![index].id,
                                                    name: controller.logisticCompany[0].logistics![index].name,
                                                    width: controller.logisticCompany[0].logistics![index].width,
                                                    weight: controller.logisticCompany[0].logistics![index].weight,
                                                    height: controller.logisticCompany[0].logistics![index].height,
                                                    qty: controller.logisticCompany[0].logistics![index].qty,
                                                    description:
                                                        controller.logisticCompany[0].logistics![index].description,
                                                    transportType:
                                                        controller.logisticCompany[0].logistics![index].transport_type,
                                                    company: controller.logisticCompany[0].name,
                                                    image: controller.logisticCompany[0].image,
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
                                                      controller.logisticCompany[0].logistics![index].name ?? '',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold, fontSize: appFontSize?.body),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      'รายละเอียด ${controller.logisticCompany[0].logistics![index].description ?? ''}',
                                                      style: TextStyle(fontSize: appFontSize?.body2),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(height: 4),
                                                    Text(
                                                      'จำนวน ${controller.logisticCompany[0].logistics![index].qty ?? ''} ',
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

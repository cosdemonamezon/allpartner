import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/ButtonRounded.dart';
import '../../../Widgets/LoadingDialog.dart';
import '../ProfileController.dart';
import '../Widgets/CheckBox.dart';

class AddDetailServiceVenderPage extends StatefulWidget {
  const AddDetailServiceVenderPage({super.key});

  @override
  State<AddDetailServiceVenderPage> createState() => _AddDetailServiceVenderPageState();
}

class _AddDetailServiceVenderPageState extends State<AddDetailServiceVenderPage> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isChecked8 = false;
  bool isChecked9 = false;
  bool isChecked10 = false;
  bool isChecked11 = false;
  bool isChecked12 = false;
  bool isChecked13 = false;
  bool isChecked14 = false;
  bool isChecked15 = false;
  bool isChecked16 = false;
  bool isChecked17 = false;
  bool isChecked18 = false;
  bool isChecked19 = false;
  bool isChecked20 = false;
  bool isChecked21 = false;
  bool isChecked22 = false;
  bool isChecked23 = false;
  bool isChecked24 = false;
  bool isChecked25 = false;
  bool isChecked26 = false;
  bool isChecked27 = false;
  bool isChecked28 = false;
  bool isChecked29 = false;
  bool isChecked30 = false;
  bool isChecked31 = false;
  bool isChecked32 = false;
  bool isChecked33 = false;
  bool isChecked34 = false;
  bool isChecked35 = false;
  bool isChecked36 = false;

  List<String> ListChackedScrap = [];
  List<String> ListChackedLogistic = [];
  List<String> ListChackedPurchase = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstInstall();
  }

  Future<void> _firstInstall() async {
    await context.read<ProfileController>().loadDetailVendorScrap();
    await context.read<ProfileController>().loadDetailVendorLogistic();
    await context.read<ProfileController>().loadDetailVendorPurchase();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ProfileController>(
      builder: (context, controller, child) => Scaffold(
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scrap',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    child: controller.detailScrap.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            // controller: _controller,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.detailScrap.length,
                            itemBuilder: (_, index) {
                              return CheckboxListTile(
                                controlAffinity: ListTileControlAffinity.leading,
                                value: controller.detailScrap[index].isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    controller.detailScrap[index].isChecked = value!;
                                    print(controller.detailScrap[index].isChecked);
                                    if (controller.detailScrap[index].isChecked == true) {
                                      // 'รถกระบะ';
                                      ListChackedScrap.add(controller.detailScrap[index].name!);
                                      print(ListChackedScrap);
                                    } else if (controller.detailScrap[index].isChecked == false) {
                                      ListChackedScrap.remove(controller.detailScrap[index].name!);
                                      print(ListChackedScrap);
                                    }
                                  });
                                },
                                title: Text(controller.detailScrap[index].name!),
                              );
                            }),
                  ),
                  // SizedBox(
                  //   child: GridView.builder(
                  //       shrinkWrap: true,
                  //       physics: NeverScrollableScrollPhysics(),
                  //       // controller: _controller,
                  //       // padding: EdgeInsets.all(15),
                  //       scrollDirection: Axis.vertical,
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 1,
                  //       ),
                  //       itemCount: controller.detailScrap.length,
                  //       itemBuilder: (context, index) {
                  //         return CheckboxListTile(
                  //           controlAffinity: ListTileControlAffinity.leading,
                  //           value: isChecked1,
                  //           onChanged: (bool? value) {
                  //             setState(() {
                  //               isChecked1 = value!;
                  //               print(isChecked1);
                  //               if (isChecked1 == true) {
                  //                 // 'รถกระบะ';
                  //                 ListChacked.add(controller.detailScrap[index].name!);
                  //                 print(ListChacked);
                  //               } else if (isChecked1 == false) {
                  //                 ListChacked.remove(controller.detailScrap[index].name!);
                  //                 print(ListChacked);
                  //               }
                  //             });
                  //           },
                  //           title: Text(controller.detailScrap[index].name!),
                  //         );
                  //       }),
                  // ),
                  // SizedBox(
                  //   child: ListView(
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.vertical,
                  //     physics: const ClampingScrollPhysics(),
                  //     children: [
                  //       // Row(
                  //       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       //   children: [
                  //       //     CheckBox(
                  //       //       cheack: isChecked1,
                  //       //       onTap: (bool? value) {
                  //       //         setState(() {
                  //       //           isChecked1 = value!;
                  //       //           print(isChecked1);
                  //       //           if (isChecked1 == true) {
                  //       //             // 'รถกระบะ';
                  //       //             ListChacked.add('ขยะ');
                  //       //             print(ListChacked);
                  //       //           } else if (isChecked1 == false) {
                  //       //             ListChacked.remove('ขยะ');
                  //       //             print(ListChacked);
                  //       //           }
                  //       //         });
                  //       //       },
                  //       //       title: 'ขยะ',
                  //       //     ),
                  //       //     CheckBox(
                  //       //       cheack: isChecked2,
                  //       //       onTap: (bool? value) {
                  //       //         setState(() {
                  //       //           isChecked2 = value!;
                  //       //           print(isChecked2);
                  //       //           if (isChecked2 == true) {
                  //       //             // 'รถกระบะ';
                  //       //             ListChacked.add('ขยะ');
                  //       //             print(ListChacked);
                  //       //           } else if (isChecked2 == false) {
                  //       //             ListChacked.remove('ขยะ');
                  //       //             print(ListChacked);
                  //       //           }
                  //       //         });
                  //       //       },
                  //       //       title: 'ขยะ',
                  //       //     ),
                  //       //     CheckBox(
                  //       //       cheack: isChecked3,
                  //       //       onTap: (bool? value) {
                  //       //         setState(() {
                  //       //           isChecked3 = value!;
                  //       //           print(isChecked3);
                  //       //           if (isChecked3 == true) {
                  //       //             // 'รถกระบะ';
                  //       //             ListChacked.add('ขยะ');
                  //       //             print(ListChacked);
                  //       //           } else if (isChecked3 == false) {
                  //       //             ListChacked.remove('ขยะ');
                  //       //             print(ListChacked);
                  //       //           }
                  //       //         });
                  //       //       },
                  //       //       title: 'ขยะ',
                  //       //     ),
                  //       //     CheckBox(
                  //       //       cheack: isChecked4,
                  //       //       onTap: (bool? value) {
                  //       //         setState(() {
                  //       //           isChecked4 = value!;
                  //       //           print(isChecked4);
                  //       //           if (isChecked4 == true) {
                  //       //             // 'รถกระบะ';
                  //       //             ListChacked.add('ขยะ');
                  //       //             print(ListChacked);
                  //       //           } else if (isChecked4 == false) {
                  //       //             ListChacked.remove('ขยะ');
                  //       //             print(ListChacked);
                  //       //           }
                  //       //         });
                  //       //       },
                  //       //       title: 'ขยะ',
                  //       //     ),
                  //       //   ],
                  //       // ),
                  //       // Row(
                  //       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       //   children: [
                  //       //     CheckBox(
                  //       //       cheack: isChecked5,
                  //       //       onTap: (bool? value) {
                  //       //         setState(() {
                  //       //           isChecked5 = value!;
                  //       //           print(isChecked5);
                  //       //           if (isChecked5 == true) {
                  //       //             // 'รถกระบะ';
                  //       //             ListChacked.add('ขยะ');
                  //       //             print(ListChacked);
                  //       //           } else if (isChecked5 == false) {
                  //       //             ListChacked.remove('ขยะ');
                  //       //             print(ListChacked);
                  //       //           }
                  //       //         });
                  //       //       },
                  //       //       title: 'ขยะ',
                  //       //     ),
                  //       //     CheckBox(
                  //       //       cheack: isChecked6,
                  //       //       onTap: (bool? value) {
                  //       //         setState(() {
                  //       //           isChecked6 = value!;
                  //       //           print(isChecked6);
                  //       //           if (isChecked6 == true) {
                  //       //             // 'รถกระบะ';
                  //       //             ListChacked.add('ขยะ');
                  //       //             print(ListChacked);
                  //       //           } else if (isChecked6 == false) {
                  //       //             ListChacked.remove('ขยะ');
                  //       //             print(ListChacked);
                  //       //           }
                  //       //         });
                  //       //       },
                  //       //       title: 'ขยะ',
                  //       //     ),
                  //       //     CheckBox(
                  //       //       cheack: isChecked7,
                  //       //       onTap: (bool? value) {
                  //       //         setState(() {
                  //       //           isChecked7 = value!;
                  //       //           print(isChecked7);
                  //       //           if (isChecked7 == true) {
                  //       //             // 'รถกระบะ';
                  //       //             ListChacked.add('ขยะ');
                  //       //             print(ListChacked);
                  //       //           } else if (isChecked7 == false) {
                  //       //             ListChacked.remove('ขยะ');
                  //       //             print(ListChacked);
                  //       //           }
                  //       //         });
                  //       //       },
                  //       //       title: 'ขยะ',
                  //       //     ),
                  //       //     CheckBox(
                  //       //       cheack: isChecked8,
                  //       //       onTap: (bool? value) {
                  //       //         setState(() {
                  //       //           isChecked8 = value!;
                  //       //           print(isChecked8);
                  //       //           if (isChecked8 == true) {
                  //       //             // 'รถกระบะ';
                  //       //             ListChacked.add('ขยะ');
                  //       //             print(ListChacked);
                  //       //           } else if (isChecked8 == false) {
                  //       //             ListChacked.remove('ขยะ');
                  //       //             print(ListChacked);
                  //       //           }
                  //       //         });
                  //       //       },
                  //       //       title: 'ขยะ',
                  //       //     ),
                  //       //   ],
                  //       // ),
                  //       // Row(
                  //       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       //   children: [
                  //       //     CheckBox(
                  //       //       cheack: isChecked9,
                  //       //       onTap: (bool? value) {
                  //       //         setState(() {
                  //       //           isChecked9 = value!;
                  //       //           print(isChecked9);
                  //       //           if (isChecked9 == true) {
                  //       //             // 'รถกระบะ';
                  //       //             ListChacked.add('ขยะ');
                  //       //             print(ListChacked);
                  //       //           } else if (isChecked9 == false) {
                  //       //             ListChacked.remove('ขยะ');
                  //       //             print(ListChacked);
                  //       //           }
                  //       //         });
                  //       //       },
                  //       //       title: 'ขยะ',
                  //       //     ),
                  //       //     CheckBox(
                  //       //       cheack: isChecked10,
                  //       //       onTap: (bool? value) {
                  //       //         setState(() {
                  //       //           isChecked10 = value!;
                  //       //           print(isChecked10);
                  //       //           if (isChecked10 == true) {
                  //       //             // 'รถกระบะ';
                  //       //             ListChacked.add('ขยะ');
                  //       //             print(ListChacked);
                  //       //           } else if (isChecked10 == false) {
                  //       //             ListChacked.remove('ขยะ');
                  //       //             print(ListChacked);
                  //       //           }
                  //       //         });
                  //       //       },
                  //       //       title: 'ขยะ',
                  //       //     ),
                  //       //     CheckBox(
                  //       //       cheack: isChecked11,
                  //       //       onTap: (bool? value) {
                  //       //         setState(() {
                  //       //           isChecked11 = value!;
                  //       //           print(isChecked11);
                  //       //           if (isChecked11 == true) {
                  //       //             // 'รถกระบะ';
                  //       //             ListChacked.add('ขยะ');
                  //       //             print(ListChacked);
                  //       //           } else if (isChecked11 == false) {
                  //       //             ListChacked.remove('ขยะ');
                  //       //             print(ListChacked);
                  //       //           }
                  //       //         });
                  //       //       },
                  //       //       title: 'ขยะ',
                  //       //     ),
                  //       //     CheckBox(
                  //       //       cheack: isChecked12,
                  //       //       onTap: (bool? value) {
                  //       //         setState(() {
                  //       //           isChecked12 = value!;
                  //       //           print(isChecked12);
                  //       //           if (isChecked12 == true) {
                  //       //             // 'รถกระบะ';
                  //       //             ListChacked.add('ขยะ');
                  //       //             print(ListChacked);
                  //       //           } else if (isChecked12 == false) {
                  //       //             ListChacked.remove('ขยะ');
                  //       //             print(ListChacked);
                  //       //           }
                  //       //         });
                  //       //       },
                  //       //       title: 'ขยะ',
                  //       //     ),
                  //       //   ],
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Logistic',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    child: controller.detailLogistic.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            // controller: _controller,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.detailLogistic.length,
                            itemBuilder: (_, index) {
                              return CheckboxListTile(
                                controlAffinity: ListTileControlAffinity.leading,
                                value: controller.detailLogistic[index].isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    controller.detailLogistic[index].isChecked = value!;
                                    print(controller.detailLogistic[index].isChecked);
                                    if (controller.detailLogistic[index].isChecked == true) {
                                      // 'รถกระบะ';
                                      ListChackedLogistic.add(controller.detailLogistic[index].name!);
                                      print(ListChackedLogistic);
                                    } else if (controller.detailLogistic[index].isChecked == false) {
                                      ListChackedLogistic.remove(controller.detailLogistic[index].name!);
                                      print(ListChackedLogistic);
                                    }
                                  });
                                },
                                title: Text(controller.detailLogistic[index].name!),
                              );
                            }),
                  ),
                  // SizedBox(
                  //   child: ListView(
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.vertical,
                  //     physics: const ClampingScrollPhysics(),
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         children: [
                  //           CheckBox(
                  //             cheack: isChecked13,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked13 = value!;
                  //                 print(isChecked13);
                  //                 if (isChecked13 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('ขนส่ง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked13 == false) {
                  //                   ListChacked.remove('ขนส่ง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'ขนส่ง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked14,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked14 = value!;
                  //                 print(isChecked14);
                  //                 if (isChecked14 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('ขนส่ง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked14 == false) {
                  //                   ListChacked.remove('ขนส่ง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'ขนส่ง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked15,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked15 = value!;
                  //                 print(isChecked15);
                  //                 if (isChecked15 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('ขนส่ง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked15 == false) {
                  //                   ListChacked.remove('ขนส่ง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'ขนส่ง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked16,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked16 = value!;
                  //                 print(isChecked16);
                  //                 if (isChecked16 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('ขนส่ง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked16 == false) {
                  //                   ListChacked.remove('ขนส่ง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'ขนส่ง',
                  //           ),
                  //         ],
                  //       ),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         children: [
                  //           CheckBox(
                  //             cheack: isChecked17,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked17 = value!;
                  //                 print(isChecked17);
                  //                 if (isChecked17 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('ขนส่ง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked17 == false) {
                  //                   ListChacked.remove('ขนส่ง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'ขนส่ง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked18,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked18 = value!;
                  //                 print(isChecked18);
                  //                 if (isChecked18 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('ขนส่ง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked18 == false) {
                  //                   ListChacked.remove('ขนส่ง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'ขนส่ง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked19,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked19 = value!;
                  //                 print(isChecked19);
                  //                 if (isChecked19 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('ขนส่ง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked19 == false) {
                  //                   ListChacked.remove('ขนส่ง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'ขนส่ง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked20,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked20 = value!;
                  //                 print(isChecked20);
                  //                 if (isChecked20 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('ขนส่ง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked20 == false) {
                  //                   ListChacked.remove('ขนส่ง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'ขนส่ง',
                  //           ),
                  //         ],
                  //       ),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         children: [
                  //           CheckBox(
                  //             cheack: isChecked21,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked21 = value!;
                  //                 print(isChecked21);
                  //                 if (isChecked21 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('ขนส่ง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked21 == false) {
                  //                   ListChacked.remove('ขนส่ง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'ขนส่ง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked22,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked22 = value!;
                  //                 print(isChecked22);
                  //                 if (isChecked22 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('ขนส่ง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked22 == false) {
                  //                   ListChacked.remove('ขนส่ง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'ขนส่ง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked23,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked23 = value!;
                  //                 print(isChecked23);
                  //                 if (isChecked23 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('ขนส่ง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked23 == false) {
                  //                   ListChacked.remove('ขนส่ง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'ขนส่ง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked24,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked24 = value!;
                  //                 print(isChecked24);
                  //                 if (isChecked24 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('ขนส่ง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked24 == false) {
                  //                   ListChacked.remove('ขนส่ง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'ขนส่ง',
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Purchase',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    child: controller.detailPurchase.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            // controller: _controller,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.detailPurchase.length,
                            itemBuilder: (_, index) {
                              return CheckboxListTile(
                                controlAffinity: ListTileControlAffinity.leading,
                                value: controller.detailPurchase[index].isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    controller.detailPurchase[index].isChecked = value!;
                                    print(controller.detailPurchase[index].isChecked);
                                    if (controller.detailPurchase[index].isChecked == true) {
                                      // 'รถกระบะ';
                                      ListChackedPurchase.add(controller.detailPurchase[index].name!);
                                      print(ListChackedPurchase);
                                    } else if (controller.detailPurchase[index].isChecked == false) {
                                      ListChackedPurchase.remove(controller.detailPurchase[index].name!);
                                      print(ListChackedPurchase);
                                    }
                                  });
                                },
                                title: Text(controller.detailPurchase[index].name!),
                              );
                            }),
                  ),
                  // SizedBox(
                  //   child: ListView(
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.vertical,
                  //     physics: const ClampingScrollPhysics(),
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         children: [
                  //           CheckBox(
                  //             cheack: isChecked25,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked25 = value!;
                  //                 print(isChecked25);
                  //                 if (isChecked25 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked25 == false) {
                  //                   ListChacked.remove('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'จัดจ้าง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked26,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked26 = value!;
                  //                 print(isChecked26);
                  //                 if (isChecked26 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked26 == false) {
                  //                   ListChacked.remove('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'จัดจ้าง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked27,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked27 = value!;
                  //                 print(isChecked27);
                  //                 if (isChecked27 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked27 == false) {
                  //                   ListChacked.remove('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'จัดจ้าง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked28,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked28 = value!;
                  //                 print(isChecked28);
                  //                 if (isChecked28 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked28 == false) {
                  //                   ListChacked.remove('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'จัดจ้าง',
                  //           ),
                  //         ],
                  //       ),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         children: [
                  //           CheckBox(
                  //             cheack: isChecked29,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked29 = value!;
                  //                 print(isChecked29);
                  //                 if (isChecked29 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked29 == false) {
                  //                   ListChacked.remove('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'จัดจ้าง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked30,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked30 = value!;
                  //                 print(isChecked30);
                  //                 if (isChecked30 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked30 == false) {
                  //                   ListChacked.remove('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'จัดจ้าง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked31,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked31 = value!;
                  //                 print(isChecked31);
                  //                 if (isChecked31 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked31 == false) {
                  //                   ListChacked.remove('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'จัดจ้าง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked32,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked32 = value!;
                  //                 print(isChecked32);
                  //                 if (isChecked32 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked32 == false) {
                  //                   ListChacked.remove('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'จัดจ้าง',
                  //           ),
                  //         ],
                  //       ),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         children: [
                  //           CheckBox(
                  //             cheack: isChecked33,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked33 = value!;
                  //                 print(isChecked33);
                  //                 if (isChecked33 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked33 == false) {
                  //                   ListChacked.remove('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'จัดจ้าง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked34,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked34 = value!;
                  //                 print(isChecked34);
                  //                 if (isChecked34 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked34 == false) {
                  //                   ListChacked.remove('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'จัดจ้าง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked35,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked35 = value!;
                  //                 print(isChecked35);
                  //                 if (isChecked35 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked35 == false) {
                  //                   ListChacked.remove('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'จัดจ้าง',
                  //           ),
                  //           CheckBox(
                  //             cheack: isChecked36,
                  //             onTap: (bool? value) {
                  //               setState(() {
                  //                 isChecked36 = value!;
                  //                 print(isChecked36);
                  //                 if (isChecked36 == true) {
                  //                   // 'รถกระบะ';
                  //                   ListChacked.add('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 } else if (isChecked36 == false) {
                  //                   ListChacked.remove('จัดจ้าง');
                  //                   print(ListChacked);
                  //                 }
                  //               });
                  //             },
                  //             title: 'จัดจ้าง',
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  ButtonRounded(
                    text: 'บันทึก',
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text(
                            'ดำเนินการเรียบร้อย',
                            //style: TextStyle(fontFamily: fontFamily),
                          ),
                          content: Text(
                            'ต้องการออกจากหน้านี้หรือไม่',
                            //style: TextStyle(fontFamily: fontFamily),
                          ),
                          actions: <CupertinoDialogAction>[
                            CupertinoDialogAction(
                              child: Text(
                                'ยกเลิก',
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            CupertinoDialogAction(
                              child: Text(
                                'ตกลง',
                              ),
                              onPressed: () async {
                                // try {
                                // if (mounted) {
                                //   LoadingDialog.close(context);
                                Navigator.of(context)
                                  ..pop()
                                  ..pop();
                                // }
                                // } catch (e) {
                                //   LoadingDialog.close(context);
                                //   showDialog(
                                //     context: context,
                                //     builder: (context) => AlertDialog(
                                //       backgroundColor: Colors.blueAccent,
                                //       title: Text("Error", style: TextStyle(color: Colors.white)),
                                //       content: Text(e.toString(), style: TextStyle(color: Colors.white)),
                                //       actions: [
                                //         TextButton(
                                //             onPressed: () {
                                //               Navigator.pop(context);
                                //             },
                                //             child: Text('OK', style: TextStyle(color: Colors.white)))
                                //       ],
                                //     ),
                                //   );
                                // }
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

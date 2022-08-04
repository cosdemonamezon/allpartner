import 'package:allpartner/Screen/Allpartner/Profile/Widgets/AddTextForm.dart';
import 'package:allpartner/Screen/Widgets/ButtonRounded.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  Map<String, dynamic> list;
  CardList({Key? key, required this.list}) : super(key: key);
  final GlobalKey<FormState> editFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5)),
            ],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.asset(
                    list['imgurl'],
                    fit: BoxFit.fill,
                    height: 100,
                    width: 80,
                  ),
                ),
              ],
            ),
            SizedBox(width: 12),
            Expanded(
              child: Opacity(
                opacity: 1,
                child: Wrap(
                  runSpacing: 2,
                  alignment: WrapAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            list['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            maxLines: 3,
                            // textAlign: TextAlign.end,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) => SizedBox(
                                  height: size.height * 0.90,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 221, 218, 218),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Form(
                                            key: editFormKey,
                                            child: Wrap(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10),
                                                  child: Text(
                                                    'หัวข้อ',
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                AddTextForm(
                                                  controller: username,
                                                  hintText: list['title'],
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10),
                                                  child: Text(
                                                    'รายละเอียด',
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                AddTextForm(
                                                  controller: username,
                                                  hintText: list['subtitle'],
                                                  maxLines: 4,
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10),
                                                  child: Text(
                                                    'ที่อยู่',
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                AddTextForm(
                                                  controller: username,
                                                  hintText:list['address'],
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 30),
                                                  child: ButtonRounded(
                                                    text: 'บันทึก',
                                                    color: Colors.blue,
                                                    textColor: Colors.white,
                                                    onPressed: () {
                                                      showCupertinoDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            CupertinoAlertDialog(
                                                          title: Text(
                                                            'ดำเนินการเรียบร้อย',
                                                            //style: TextStyle(fontFamily: fontFamily),
                                                          ),
                                                          content: Text(
                                                            'ต้องการออกจากหน้านี้หรือไม่',
                                                            //style: TextStyle(fontFamily: fontFamily),
                                                          ),
                                                          actions: <
                                                              CupertinoDialogAction>[
                                                            CupertinoDialogAction(
                                                              child: Text(
                                                                'ยกเลิก',
                                                                // style: TextStyle(
                                                                //   color: kThemeTextColor,
                                                                //   fontFamily: fontFamily,
                                                                //   fontWeight: FontWeight.bold,
                                                                // ),
                                                              ),
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      context,
                                                                      true),
                                                            ),
                                                            CupertinoDialogAction(
                                                              child: Text(
                                                                'ตกลง',
                                                                // style: TextStyle(
                                                                //   color: kThemeTextColor,
                                                                //   fontFamily: fontFamily,
                                                                // ),
                                                              ),
                                                              onPressed: () =>
                                                                  Navigator.of(
                                                                      context)
                                                                    ..pop()
                                                                    ..pop(),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit)),
                        //BookingOptionsPopupMenuWidget(booking: _booking),
                      ],
                    ),
                    Divider(height: 8, thickness: 0),
                    Row(
                      children: [
                        Icon(
                          Icons.build_circle_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            list['subtitle'],
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            list['address'],
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

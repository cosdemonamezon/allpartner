import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/ButtonRounded.dart';
import '../../Profile/Widgets/AddTextForm.dart';

class QuotationPage extends StatefulWidget {
  const QuotationPage({super.key});

  @override
  State<QuotationPage> createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage> {
  final GlobalKey<FormState> addFormKey = GlobalKey<FormState>();
  final TextEditingController title = TextEditingController();
  final TextEditingController remark = TextEditingController();
  final _controller = ScrollController();
  FilePickerResult? result;
  List<PlatformFile>? listFile;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'เสนอราคา',
          //style: TextStyle(color: Colors.deepOrange),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          // key: addFormKey,
                          child: Wrap(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'หัวข้อ',
                                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                                ),
                              ),
                              AddTextForm(
                                controller: title,
                                // hintText: widget.position,
                              ),
                              SizedBox(
                                height: size.height * 0.07,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'รายละเอียด',
                                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                                ),
                              ),
                              AddTextForm(
                                controller: remark,
                                // hintText: widget.degree,
                                maxLines: 4,
                              ),

                              // Padding(
                              //   padding: EdgeInsets.symmetric(vertical: 10),
                              //   child: Text(
                              //     'อัพโหลดไฟล์',
                              //     style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                              listFile != null
                                  ? GridView.builder(
                                      shrinkWrap: true,
                                      controller: _controller,
                                      padding: EdgeInsets.all(15),
                                      scrollDirection: Axis.vertical,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                      ),
                                      itemCount: listFile!.length,
                                      itemBuilder: (context, index) {
                                        final file = listFile![index];
                                        inspect(file);

                                        return buildFille(file);
                                      })
                                  : SizedBox.shrink(),
                              SizedBox(
                                height: size.height * 0.2,
                              ),
                              listFile != null && listFile!.isNotEmpty
                                  ? Center(
                                      child: Container(
                                        height: size.height * 0.05,
                                        width: size.width * 0.25,
                                        color: Colors.redAccent,
                                        child: InkWell(
                                          onTap: () async {
                                            setState(() {
                                              listFile!.clear();
                                            });
                                          },
                                          child: Center(
                                              child: Text(
                                            'ลบไฟล์',
                                            style: TextStyle(color: Colors.white),
                                          )),
                                        ),
                                      ),
                                    )
                                  : Center(
                                      child: Container(
                                        height: size.height * 0.05,
                                        width: size.width * 0.25,
                                        color: Colors.blueAccent,
                                        child: InkWell(
                                          onTap: () async {
                                            final result = await FilePicker.platform.pickFiles();
                                            setState(() {
                                              if (result == null) return;

                                              listFile = result.files;
                                            });
                                          },
                                          child: Center(
                                              child: Text(
                                            'อัพโหลดไฟล์',
                                            style: TextStyle(color: Colors.white),
                                          )),
                                        ),
                                      ),
                                    ),
                              // : Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Container(
                              //         height: size.height * 0.05,
                              //         width: size.width * 0.25,
                              //         color: Colors.blueAccent,
                              //         child: InkWell(
                              //           onTap: () async {
                              //             final result = await FilePicker.platform.pickFiles();
                              //             setState(() {
                              //               if (result == null) return;

                              //               listFile = result.files;
                              //             });
                              //           },
                              //           child: Center(
                              //               child: Text(
                              //             'อัพโหลดไฟล์',
                              //             style: TextStyle(color: Colors.white),
                              //           )),
                              //         ),
                              //       ),
                              //       SizedBox(
                              //         width: 50,
                              //       ),
                              //       Container(
                              //         height: size.height * 0.05,
                              //         width: size.width * 0.25,
                              //         color: Colors.redAccent,
                              //         child: InkWell(
                              //           onTap: () async {
                              //             setState(() {
                              //               listFile!.clear();
                              //             });
                              //           },
                              //           child: Center(
                              //               child: Text(
                              //             'ลบไฟล์',
                              //             style: TextStyle(color: Colors.white),
                              //           )),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              SizedBox(
                                height: size.height * 0.25,
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
                                            // style: TextStyle(
                                            //   color: kThemeTextColor,
                                            //   fontFamily: fontFamily,
                                            //   fontWeight: FontWeight.bold,
                                            // ),
                                          ),
                                          onPressed: () => Navigator.pop(context),
                                        ),
                                        CupertinoDialogAction(
                                          child: Text(
                                            'ตกลง',
                                            // style: TextStyle(
                                            //   color: kThemeTextColor,
                                            //   fontFamily: fontFamily,
                                            // ),
                                          ),
                                          onPressed: () async {
                                            // addFormKey.currentState!.save();
                                            // // LoadingDialog.open(context);
                                            // // final String position1 = position.text;
                                            // // final String degree1 = degree.text;
                                            // // final String major1 = major.text;
                                            // // final String salary1 = salary.text;
                                            // // final String exp1 = exp.text;
                                            // // final String qty1 = qty.text;
                                            // // final String description1 = description.text;
                                            // await JobService().updatePosition(
                                            //     positionId: widget.idPosition!,
                                            //     user_id: widget.idCompany.toString(),
                                            //     position: position.text,
                                            //     degree: degree.text,
                                            //     major: major.text,
                                            //     salary: salary.text,
                                            //     exp: exp.text,
                                            //     qty: qty.text,
                                            //     description: description.text);
                                            // await context.read<JobController>().loadPositionCompay(id: widget.idCompany!);
                                            // LoadingDialog.close(context);
                                            if (mounted) {
                                              Navigator.of(context)
                                                ..pop()
                                                ..pop();
                                            }
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFille(PlatformFile file) {
    final extension = file.extension ?? 'none';

    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(12)),
              child: Text(
                '.$extension',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )),
            SizedBox(
              height: 8,
            ),
            Text(
              file.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/ButtonRounded.dart';
import '../../../Widgets/LoadingDialog.dart';
import '../../../app/appController.dart';
import '../../Profile/Widgets/AddTextForm.dart';
import '../ProductServicer.dart';

class QuotationPage extends StatefulWidget {
  const QuotationPage({super.key, required this.page, required this.companieId});
  final String page;
  final int companieId;
  @override
  State<QuotationPage> createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage> {
  final GlobalKey<FormState> addFormKey = GlobalKey<FormState>();
  final TextEditingController title = TextEditingController();
  final TextEditingController remark = TextEditingController();
  final _controller = ScrollController();
  FilePickerResult? result;
  PlatformFile? _selectedFile;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstInstall();
  }

  Future<void> _firstInstall() async {
    await context.read<AppController>().initialize();
    final user = context.read<AppController>().user;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = context.read<AppController>().user;
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

                              _selectedFile != null ? Center(child: buildFille(_selectedFile!)) : SizedBox.shrink(),
                              SizedBox(
                                height: size.height * 0.2,
                              ),
                              _selectedFile != null
                                  ? Center(
                                      child: Container(
                                        height: size.height * 0.05,
                                        width: size.width * 0.25,
                                        color: Colors.redAccent,
                                        child: InkWell(
                                          onTap: () async {
                                            setState(() {
                                              _selectedFile = null;
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

                                              _selectedFile = result.files[0];
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
                                height: size.height * 0.15,
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
                                            switch (widget.page) {
                                              case "Logistic":
                                                {
                                                  try {
                                                    LoadingDialog.open(context);
                                                    await ProductService().postQuotationLogistic(
                                                      user_id: user!.id.toString(),
                                                      logistic_companie_id: widget.companieId.toString(),
                                                      title: title.text,
                                                      remark: remark.text,
                                                      file: _selectedFile!,
                                                    );
                                                    if (mounted) {
                                                      LoadingDialog.close(context);
                                                      Navigator.of(context)
                                                        ..pop()
                                                        ..pop();
                                                    }
                                                  } catch (e) {
                                                    LoadingDialog.close(context);
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) => AlertDialog(
                                                        backgroundColor: Colors.blueAccent,
                                                        title: Text("Error", style: TextStyle(color: Colors.white)),
                                                        content:
                                                            Text(e.toString(), style: TextStyle(color: Colors.white)),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(context);
                                                              },
                                                              child: Text('OK', style: TextStyle(color: Colors.white)))
                                                        ],
                                                      ),
                                                    );
                                                  }

                                                  break;
                                                }
                                              case "Scrap":
                                                {
                                                  try {
                                                    LoadingDialog.open(context);
                                                    await ProductService().postQuotationScrap(
                                                      user_id: user!.id.toString(),
                                                      scrap_companie_id: widget.companieId.toString(),
                                                      title: title.text,
                                                      remark: remark.text,
                                                      file: _selectedFile!,
                                                    );
                                                    if (mounted) {
                                                      LoadingDialog.close(context);
                                                      Navigator.of(context)
                                                        ..pop()
                                                        ..pop();
                                                    }
                                                  } catch (e) {
                                                    LoadingDialog.close(context);
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) => AlertDialog(
                                                        backgroundColor: Colors.blueAccent,
                                                        title: Text("Error", style: TextStyle(color: Colors.white)),
                                                        content:
                                                            Text(e.toString(), style: TextStyle(color: Colors.white)),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(context);
                                                              },
                                                              child: Text('OK', style: TextStyle(color: Colors.white)))
                                                        ],
                                                      ),
                                                    );
                                                  }

                                                  break;
                                                }
                                              case "Purchase":
                                                {
                                                  try {
                                                    LoadingDialog.open(context);
                                                    await ProductService().postQuotationPurchase(
                                                      user_id: user!.id.toString(),
                                                      purchase_companie_id: widget.companieId.toString(),
                                                      title: title.text,
                                                      remark: remark.text,
                                                      file: _selectedFile!,
                                                    );
                                                    if (mounted) {
                                                      LoadingDialog.close(context);
                                                      Navigator.of(context)
                                                        ..pop()
                                                        ..pop();
                                                    }
                                                  } catch (e) {
                                                    LoadingDialog.close(context);
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) => AlertDialog(
                                                        backgroundColor: Colors.blueAccent,
                                                        title: Text("Error", style: TextStyle(color: Colors.white)),
                                                        content:
                                                            Text(e.toString(), style: TextStyle(color: Colors.white)),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(context);
                                                              },
                                                              child: Text('OK', style: TextStyle(color: Colors.white)))
                                                        ],
                                                      ),
                                                    );
                                                  }

                                                  break;
                                                }
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
      onTap: () => OpenFile.open(file.path),
      child: Container(
        width: 200,
        height: 200,
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
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

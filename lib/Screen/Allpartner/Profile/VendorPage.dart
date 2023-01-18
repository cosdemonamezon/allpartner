import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

import '../../Widgets/LoadingDialog.dart';
import '../../app/appController.dart';
import 'Widgets/TextFrom.dart';

class VendorPage extends StatefulWidget {
  const VendorPage({super.key});

  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  final GlobalKey<FormState> profileForm = GlobalKey<FormState>();
  final TextEditingController? name = TextEditingController();
  final TextEditingController? email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController? tax = TextEditingController();
  final TextEditingController? address1 = TextEditingController();
  final TextEditingController? address2 = TextEditingController();
  final TextEditingController? address3 = TextEditingController();
  final TextEditingController? country = TextEditingController();
  final TextEditingController? postcode = TextEditingController();
  final TextEditingController? fax = TextEditingController();
  // final TextEditingController? type = TextEditingController();
  FilePickerResult? result;
  List<PlatformFile>? listFile;
  final _controller = ScrollController();

  void initState() {
    // TODO: implement initState
    super.initState();
    _firstInstall();
  }

  Future<void> _firstInstall() async {
    await context.read<AppController>().initialize();
  }

  final List<String> _dropdownValues = [
    "Logistic",
    "Sracp",
    "Other",
  ];
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Form(
        key: profileForm,
        child: ListView(
          // primary: true,
          children: [
            TextFieldRegisterWidget(
              controller: name,
              // hintText: 'สถานศึกษาที่จบ',
              // hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].location_of_educate != null
              //     ? user.user_job_detail![0].location_of_educate
              //     : 'สถานศึกษาที่จบ',
              labelText: "ชื่อบริษัท",
              // keyboardType: TextInputType.emailAddress,
              // validator: (value) {
              //   if (value!.isEmpty || value == '') {
              //     return 'กรุณากรอกมหาวิทยาลัย';
              //   }
              // }
            ),
            TextFieldRegisterWidget(
              controller: email,
              // hintText: 'สาขาที่จบ',
              // hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].major != null
              //     ? user.user_job_detail![0].major
              //     : 'สาขาที่จบ',
              labelText: "อีเมลล์",
              // keyboardType: TextInputType.emailAddress,
              // validator: (value) {
              //   if (value!.isEmpty || value == '') {
              //     return 'กรุณากรอกสาขาที่จบ';
              //   }
              // }
            ),
            TextFieldRegisterWidget(
              controller: phone,
              // hintText: '1.00',
              // hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].grade != null
              //     ? user.user_job_detail![0].grade
              //     : '1.00',
              labelText: "เบอร์โทร",
              // keyboardType: TextInputType.emailAddress,
              // validator: (value) {
              //   if (value!.isEmpty || value == '') {
              //     return 'กรุณากรอกเกรดเฉลี่ย';
              //   }
              // }
            ),
            TextFieldRegisterWidget(
              controller: tax,
              // hintText: '2565',
              // hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].finished != null
              //     ? user.user_job_detail![0].finished
              //     : '2565',
              labelText: "Tax",
              // keyboardType: TextInputType.emailAddress,
              // validator: (value) {
              //   if (value!.isEmpty || value == '') {
              //     return 'กรุณากรอกปีจบการศึกษา';
              //   }
              // }
            ),
            TextFieldRegisterWidget(
              controller: fax,
              // hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].english != null
              //     ? user.user_job_detail![0].english
              //     : '',
              labelText: "Fax",
              // keyboardType: TextInputType.emailAddress,
              // validator: (value) {
              //   if (value!.isEmpty || value == '') {
              //     return 'กรุณากรอกอีเมลล์';
              //   }
              // }
            ),
            TextFieldRegisterWidget(
              controller: address1,
              // hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].position != null
              //     ? user.user_job_detail![0].position
              //     : '',
              labelText: "ที่อยู่ 1",
              // keyboardType: TextInputType.emailAddress,
              // validator: (value) {
              //   if (value!.isEmpty || value == '') {
              //     return 'กรุณากรอกตำแหน่ง';
              //   }
              // }
            ),
            TextFieldRegisterWidget(
              controller: address2,
              // hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].salary != null
              //     ? user.user_job_detail![0].salary
              //     : '',
              labelText: "ที่อยู่ 2",
              // keyboardType: TextInputType.number,
              // validator: (value) {
              //   if (value!.isEmpty || value == '') {
              //     return 'กรุณากรอกเงินเดือนที่ต้องการ';
              //   }
              // }
            ),
            TextFieldRegisterWidget(
              controller: address3,
              // hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].exp != null
              //     ? user.user_job_detail![0].exp
              //     : '',
              labelText: "ที่อยู่ 3",
              // keyboardType: TextInputType.multiline,
              // validator: (value) {
              //   if (value!.isEmpty || value == '') {
              //     return 'กรุณากรอกประสบการณ์การทำงาน ถ้าไม่มีให้ขีด (-)';
              //   }
              // }
            ),
            TextFieldRegisterWidget(
              keyboardType: TextInputType.multiline,
              controller: country,
              // hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].remark != null
              //     ? user.user_job_detail![0].remark
              //     : '',
              labelText: "จังหวัด",
              // keyboardType: TextInputType.emailAddress,
              // validator: (value) {
              //   if (value!.isEmpty || value == '') {
              //     return 'กรุณากรอกคำอธิบายเกี่ยวกับตัวเอง';
              //   }
              // }
            ),
            TextFieldRegisterWidget(
              controller: postcode,
              // hintText: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].thai != null
              //     ? user.user_job_detail![0].thai
              //     : '',
              labelText: "ไปรษณีย์",
              // keyboardType: TextInputType.emailAddress,
              // validator: (value) {
              //   if (value!.isEmpty || value == '') {
              //     return 'กรุณากรอกอีเมลล์';
              //   }
              // }
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text('ประเภทบริษัท'),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                      color: Colors.white),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      // hint: user.user_job_detail!.isNotEmpty && user.user_job_detail?[0].major != null
                      //     ? Text(user.user_job_detail![0].degree!)
                      //     : Text(''),
                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
                      items: _dropdownValues
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  child: Text(
                                    value,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ))
                          .toList(),
                      isExpanded: false,
                      value: _selectedValue,
                      onChanged: (String? value) async {
                        setState(() {
                          _selectedValue = value!;
                          print(_selectedValue);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text('ไฟล์ภาพ'),
            ),
            listFile != null
                ? GridView.builder(
                    shrinkWrap: true,
                    controller: _controller,
                    padding: EdgeInsets.all(15),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                    ),
                    itemCount: listFile!.length,
                    itemBuilder: (context, index) {
                      final file = listFile![index];
                      inspect(file);

                      return buildFille(file);
                    })
                : SizedBox.shrink(),
            SizedBox(
              height: size.height * 0.05,
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
                      width: size.width * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        // boxShadow: [
                        //   BoxShadow(color: Colors.blueAccent.withOpacity(0.1), blurRadius: 10, offset: Offset(0, -5)),
                        // ],
                      ),
                      child: InkWell(
                        onTap: () async {
                          final result = await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.image);
                          setState(() {
                            if (result == null) return;

                            listFile = result.files;
                          });
                        },
                        child: Center(
                          child: Icon(Icons.plus_one),
                        ),
                      ),
                    ),
                  ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
                // boxShadow: [
                //   BoxShadow(color: Colors.blueAccent.withOpacity(0.1), blurRadius: 10, offset: Offset(0, -5)),
                // ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: Text(
                              'ยืนยัน',
                              //style: TextStyle(fontFamily: fontFamily),
                            ),
                            content: Text(
                              'ยืนยันการบันทึก',
                              //style: TextStyle(fontFamily: fontFamily),
                            ),
                            actions: [
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
                                  'ยืนยัน',
                                  // style: TextStyle(
                                  //   color: kThemeTextColor,
                                  //   fontFamily: fontFamily,
                                  // ),
                                ),
                                onPressed: () async {
                                  try {
                                    LoadingDialog.open(context);
                                    // await ProfileService().setInformationDetil(
                                    //   user_job_id: widget.id.toString(),
                                    //   location_of_educate: educate?.text,
                                    //   major: major?.text,
                                    //   degree: _selectedValue,
                                    //   grade: grade?.text,
                                    //   finished: finished?.text,
                                    //   thai: thai?.text,
                                    //   english: english?.text,
                                    //   china: china?.text,
                                    //   japan: japan?.text,
                                    //   exp: exp?.text,
                                    //   position: position?.text,
                                    //   salary: salary?.text,
                                    //   remark: remark?.text,
                                    // );
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
                                        content: Text('กรุณาใส่ระดับการศึกษา', style: TextStyle(color: Colors.white)),
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
                                },
                              )
                            ],
                          ),
                        );
                      },
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: Colors.blue,
                      elevation: 0,
                      highlightElevation: 0,
                      hoverElevation: 0,
                      focusElevation: 0,
                      child: Text("Save", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFille(PlatformFile file) {
    final extension = file.extension ?? 'none';

    return InkWell(
      onTap: () => OpenFile.open(file.path),
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )),
            SizedBox(
              height: 8,
            ),
            Text(
              file.name,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

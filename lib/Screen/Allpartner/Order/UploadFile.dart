import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadFile extends StatefulWidget {
  UploadFile({Key? key}) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  FilePickerResult? result;
  PlatformFile? file;
  FilePickerResult? result1;
  PlatformFile? file1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('บันทึกใบเสนอราคา'),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Card(
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1 . อัปโหลด'),
                          InkWell(
                            onTap: () async {
                              result = await FilePicker.platform.pickFiles();
                              setState(() {
                                if (result != null) {
                                  file = result!.files.first;
                                  print(file);
                                } else {
                                  print('No file');
                                }
                              });
                            },
                            child: Container(
                              height: size.height * 0.04,
                              width: size.width * 0.08,
                              color: file != null
                                  ? Colors.blueAccent
                                  : Colors.grey,
                              child: Center(
                                  child: file != null
                                      ? Icon(
                                          Icons.arrow_upward,
                                          size: 20,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.arrow_downward,
                                          size: 20,
                                          color: Colors.white,
                                        )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('2 . อัปโหลด'),
                          InkWell(
                            onTap: () async {
                              result1 = await FilePicker.platform.pickFiles();
                              setState(() {
                                if (result1 != null) {
                                  file1 = result!.files.first;
                                  print(file);
                                } else {
                                  print('No file');
                                }
                              });
                            },
                            child: Container(
                              height: size.height * 0.04,
                              width: size.width * 0.08,
                              color: file1 != null
                                  ? Colors.blueAccent
                                  : Colors.grey,
                              child: Center(
                                  child: file1 != null
                                      ? Icon(
                                          Icons.arrow_upward,
                                          size: 20,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.arrow_downward,
                                          size: 20,
                                          color: Colors.white,
                                        )),
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
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        //shape: CircularNotchedRectangle(),
        elevation: 25,
        child: Container(
          height: size.height * 0.10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                    ..pop()
                    ..pop();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.32,
                    //color: Colors.red,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                        child: Text(
                      'ยืนยัน',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

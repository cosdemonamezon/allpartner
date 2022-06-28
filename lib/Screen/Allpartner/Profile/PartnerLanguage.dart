import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartnerLanguage extends StatefulWidget {
  PartnerLanguage({Key? key}) : super(key: key);

  @override
  State<PartnerLanguage> createState() => _PartnerLanguageState();
}

class _PartnerLanguageState extends State<PartnerLanguage> {
  bool langchang = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ภาษาของแอป',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Column(
          children: [
            ListTile(
              onTap: () async {
                final b = await changeLanguage(context, 'en');
                if (b != null) {
                  if (b == true) {
                    setState(() {
                      langchang = true;
                    });
                  }
                }
                
              },
              contentPadding: EdgeInsets.zero,
              title: Text(
                'English',
                style: TextStyle(
                  fontSize: 16,
                  color: langchang == true ?Colors.blue:Colors.black,
                ),
              ),
              trailing: langchang == true
                  ? Icon(
                      Icons.done,
                      color: Colors.blue,
                    )
                  : SizedBox(),
            ),
            ListTile(
              onTap: () async {
                final a = await changeLanguage(context, 'th');
                if (a != null) {
                  if (a == false) {
                    setState(() {
                      langchang = false;
                    });
                  }
                }
              },
              contentPadding: EdgeInsets.zero,
              title: Text(
                'ภาษาไทย',
                style: TextStyle(
                  fontSize: 16,
                  color: langchang == false ?Colors.blue:Colors.black,
                ),
              ),
              trailing: langchang == false
                  ? Icon(
                      Icons.done,
                      color: Colors.blue,
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> changeLanguage(BuildContext context, String lang) async {
    return showCupertinoModalPopup<bool>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text('เลือกภาษาที่ต้องการเปลี่ยน'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: Text('เปลี่ยนเป็นภาษา ${lang}'),
            onPressed: () async {
              if (lang == 'th') {
                setState(() {
                  langchang == false;
                });
                Navigator.of(context).pop(false);
              } else {
                setState(() {
                  langchang == true;
                });
                Navigator.of(context).pop(true);
              }
              //Navigator.pop(context);
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          child: Text('cancel'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
    );
  }
}

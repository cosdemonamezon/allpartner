

import 'package:allpartner/Screen/Widgets/SearchTextField.dart';
import 'package:flutter/material.dart';

class SetHelp extends StatefulWidget {
  SetHelp({Key? key}) : super(key: key);

  @override
  State<SetHelp> createState() => _SetHelpState();
}

class _SetHelpState extends State<SetHelp> {
  List<String> helpdata = [
    'I cant get OTP.',
    'General solutions for issues with LPG App',
    'I’m not receiving the verification code text message',
    'Why cant I verify my credit card?',
    'How to connect blue card',
    'Chenging the LPG App language setting',
    'Turning notification messages on and off',
    'Using coupons',
    'How to connect your account with Facebook',
    'How to reorder',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ศูนย์ช่วยเหลือ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SearchTextField(),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'คำถามที่พบบ่อย',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: helpdata.length,
                itemBuilder: (BuildContext context, int i) {
                  return ListTile(
                    onTap: () {},
                    title: Text(helpdata[i]),
                    trailing: Icon(Icons.arrow_forward_ios),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

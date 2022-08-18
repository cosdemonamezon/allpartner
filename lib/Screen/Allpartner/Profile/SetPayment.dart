

import 'package:allpartner/Screen/Widgets/BlockButtonWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetPayment extends StatefulWidget {
  SetPayment({Key? key}) : super(key: key);

  @override
  State<SetPayment> createState() => _SetPaymentState();
}

class _SetPaymentState extends State<SetPayment> {
  dynamic selectedRadioTile;
  List<Map<String, dynamic>> pay = [
    {
      "id": 1,
      "imgurl": "assets/images/ALLZERVELogo.png",
      "title": "PayPal",
      "subtitle": "Chek to pay with your PayPal Connect"
    },
    {
      "id": 2,
      "imgurl": "assets/images/ALLZPartnerLogo.png",
      "title": "BankA",
      "subtitle": "Chek to pay with your BankA Connect"
    },
    {
      "id": 3,
      "imgurl": "assets/images/ALLZPrimeLogo.png",
      "title": "Cash",
      "subtitle": "Chek to pay with your Cash Connect"
    }
  ];

  Map<String, dynamic> payData = {
    "imgurl": "assets/images/ALLZPrimeLogo.png",
    "name": "Thawatchai",
    "tax": "Tax Amount",
    "value": "200",
    "subtotal": "Sub Amount",
    "valuesub": "400",
    "total": "Total Amount",
    "valuetotal": "400",
  };

  setSelectedRadioTile(dynamic val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ข้อมูลบัตรเครดิต",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  leading: Icon(
                    Icons.payment,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Payment Option",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(),
                  ),
                  subtitle: Text("Select your preferred payment mode",
                      style: TextStyle()),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                itemCount: pay.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Theme(
                      data: ThemeData(
                        toggleableActiveColor: Colors.blue,
                      ),
                      child: RadioListTile(
                        value: pay[index],
                        groupValue: selectedRadioTile,
                        activeColor: Colors.blueAccent,
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile(pay[index]);
                        },
                        title: Text(pay[index]['title']),
                        subtitle: Text(pay[index]['subtitle']),
                        secondary: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(pay[index]['imgurl']),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomWidget(payData),
    );
  }

  Widget buildBottomWidget(Map<String, dynamic> data) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //PaymentDetailsWidget(data: data,),
          BlockButtonWidget(
            text: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Confirm & Pay Now",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.white),
              ],
            ),
            color: Colors.blue,
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
                      onPressed: () => Navigator.pop(context, true),
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'ตกลง',
                        // style: TextStyle(
                        //   color: kThemeTextColor,
                        //   fontFamily: fontFamily,
                        // ),
                      ),
                      onPressed: () => Navigator.of(context)..pop()..pop(),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

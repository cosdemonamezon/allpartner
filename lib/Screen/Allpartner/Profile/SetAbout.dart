import 'package:flutter/material.dart';

class SetAbout extends StatefulWidget {
  SetAbout({Key? key}) : super(key: key);

  @override
  State<SetAbout> createState() => _SetAboutState();
}

class _SetAboutState extends State<SetAbout> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: const [
              Color.fromARGB(255, 167, 199, 235),
              Color.fromARGB(255, 141, 173, 241)
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                // Positioned(
                //     bottom: 0,
                //     right: 10,
                //     child:
                //         Image.asset('assets/images/ALLZERVE.png', height: 100)),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Image.asset(
                              'assets/icons/arrow-left.png',
                              height: 30,
                            ),
                          ),
                          Text(
                            'เกี่ยวกับเรา',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 20)
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
                  padding: EdgeInsets.only(top: 25, bottom: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Image.asset('assets/images/ALLZERVELogo.png',
                              height: 80)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Divider(color: Colors.grey),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'เวอร์ชัน',
                              style: TextStyle(fontSize: 14),
                            ),
                            Text(
                              '1.0.0',
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey),
                      GestureDetector(
                        onTap: () async {},
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          child: Text(
                            'นโยบายการคุ้มครองข้อมูลส่วนบคคล',
                            style: TextStyle(fontSize: 16),
                          ),
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
  }
}

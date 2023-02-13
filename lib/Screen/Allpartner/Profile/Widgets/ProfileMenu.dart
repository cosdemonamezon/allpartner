import 'package:allpartner/appTheme.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final String title;
  final String image;
  final dynamic page;
  const ProfileMenu({Key? key, required this.title, required this.image, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    return InkWell(
      onTap: () => page == null
          ? {}
          : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => page,
              ),
            ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Expanded(flex: 1, child: Image.asset('assets/icons/$image.png', height: 30)),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 7,
              child: Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(flex: 1, child: Image.asset('assets/icons/arrow_right.png', height: 30)),
          ],
        ),
      ),
    );
  }
}

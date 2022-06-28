import 'package:flutter/material.dart';
import 'dart:math' as math;

class SlideItemWidget extends StatelessWidget {
  final String slide;
  const SlideItemWidget({Key? key, required this.slide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(
              Directionality.of(context) == TextDirection.rtl ? math.pi : 0),
          child: Image.asset(
            slide,
            width: double.infinity,
            height: 280,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
          child: SizedBox(
            width: size.width / 2.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'This layout facilitates the browsing of uncropped peer content',
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.fade,
                  maxLines: 3,
                ),
                MaterialButton(
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  color: Colors.blueAccent,
                  shape: StadiumBorder(),
                  elevation: 0,
                  child: Text(
                    'slide.button',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonJobSelect extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Color? boderColor;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final String? iconImage;
  const ButtonJobSelect({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    this.onPressed,
    this.boderColor,
    this.iconColor,
    this.iconImage,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AbsorbPointer(
      absorbing: onPressed != null ? false : true,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.0),
          backgroundColor: MaterialStateProperty.all<Color>(onPressed != null ? color : Colors.blue),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 18,),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: onPressed != null ? boderColor ?? color : Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(size.height / 70)),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: size.width*0.05,),
            iconImage != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(iconImage.toString(),
                        height: size.height*0.03, width: size.width*0.03, color: iconColor),
                  )
                : SizedBox.shrink(),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: 18),
            ),
          ],
        ), 
      ),
    );
  }
}
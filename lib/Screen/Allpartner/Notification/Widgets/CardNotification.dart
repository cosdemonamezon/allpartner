import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardNotification extends StatelessWidget {
  const CardNotification({Key? key, required this.notidata}) : super(key: key);
  final Map<String, dynamic> notidata;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ListTile(
        dense: true,
        isThreeLine: true,
        minLeadingWidth: 0.4,
        minVerticalPadding: 0.5,
        onTap: (){},
        leading: SvgPicture.asset('assets/icons/notification_bing_num.svg',color: Colors.blue,),
        title: Text(notidata['title']),
        subtitle: Text(notidata['subtitle']),
        trailing: SvgPicture.asset('assets/icons/arrow-right.svg'),
      ),
    );
  }
}

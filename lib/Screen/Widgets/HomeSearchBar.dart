import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget implements PreferredSize {
  const HomeSearchBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => Size(50 , 180);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '10',
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 0),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 188, 211, 229),
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 0),
              child: Icon(Icons.search, color: Colors.grey),
            ),
            Expanded(
              child: Text(
                "Search for home service",
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}

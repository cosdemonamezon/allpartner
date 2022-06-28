import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  Map<String, dynamic> list;
  CardList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5)),
            ],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.asset(
                    list['imgurl'],
                    fit: BoxFit.fill,
                    height: 100,
                    width: 80,
                  ),
                ),
                // Container(
                //   width: 80,
                //   decoration: BoxDecoration(
                //     color: Colors.blue,
                //     borderRadius: BorderRadius.only(
                //         bottomRight: Radius.circular(10),
                //         bottomLeft: Radius.circular(10)),
                //   ),
                //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                //   child: Column(
                //     children: [
                //       Text(list['hh'],
                //           maxLines: 1,
                //           style: TextStyle(color: Colors.white, height: 1.4),
                //           softWrap: false,
                //           textAlign: TextAlign.center,
                //           overflow: TextOverflow.fade),
                //       Text(list['dd'],
                //           maxLines: 1,
                //           style: TextStyle(color: Colors.white, height: 1),
                //           softWrap: false,
                //           textAlign: TextAlign.center,
                //           overflow: TextOverflow.fade),
                //       Text(list['mm'],
                //           maxLines: 1,
                //           style: TextStyle(color: Colors.white, height: 1),
                //           softWrap: false,
                //           textAlign: TextAlign.center,
                //           overflow: TextOverflow.fade),
                //     ],
                //   ),
                // ),
              ],
            ),
            SizedBox(width: 12),
            Expanded(
              child: Opacity(
                opacity: 1,
                child: Wrap(
                  runSpacing: 2,
                  alignment: WrapAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            list['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            maxLines: 3,
                            // textAlign: TextAlign.end,
                          ),
                        ),
                        IconButton(
                          onPressed: (){}, 
                          icon: Icon(Icons.edit)),
                        //BookingOptionsPopupMenuWidget(booking: _booking),
                      ],
                    ),
                    Divider(height: 8, thickness: 0),
                    Row(
                      children: [
                        Icon(
                          Icons.build_circle_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            list['subtitle'],
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            list['address'],
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    // Divider(height: 8, thickness: 0),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Expanded(
                    //       flex: 1,
                    //       child: Text(
                    //         "Total",
                    //         maxLines: 1,
                    //         overflow: TextOverflow.fade,
                    //         softWrap: false,
                    //         style: TextStyle(fontWeight: FontWeight.w500),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       flex: 1,
                    //       child: Align(
                    //         alignment: AlignmentDirectional.centerEnd,
                    //         child: Text(
                    //           list['total'],
                    //           style: TextStyle(color: Colors.deepOrange),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

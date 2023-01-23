import 'package:allpartner/Screen/Allpartner/News/NewsScreen.dart';
import 'package:flutter/material.dart';

class RecommendedCarouselWidget extends StatelessWidget {
  final List<Map<String, dynamic>>? recommendpartner;
  RecommendedCarouselWidget({Key? key, this.recommendpartner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 10),
        primary: false,
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: recommendpartner!.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreen()));
            },
            child: Container(
              width: 180,
              margin: EdgeInsetsDirectional.only(end: 20, start: index == 0 ? 20 : 0, top: 20, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(color: Colors.blueAccent.withOpacity(0.1), blurRadius: 1, offset: Offset(0, 0)),
                ],
              ),
              child: Column(
                children: [
                  Hero(
                    //tag: 'recommended_carousel' + _service.id,
                    // ignore: prefer_interpolation_to_compose_strings
                    tag: 'recommended_carousel' + recommendpartner![index].toString(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      child: Image.asset(
                        recommendpartner![index]['img'],
                        //color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          recommendpartner![index]['name'],
                          maxLines: 2,
                          style: TextStyle(color: Color.fromARGB(255, 90, 88, 88)),
                        ),
                        //SizedBox(height: 10),
                        Wrap(
                          spacing: 5,
                          alignment: WrapAlignment.spaceBetween,
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.end,
                          children: [
                            Text(
                              "Start from",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            // Column(
                            //   children: [
                            //     Text(recommendpartner![index]['old'], style: TextStyle(color: Colors.grey),),
                            //     Text(recommendpartner![index]['price'], style: TextStyle(color: Colors.black))
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

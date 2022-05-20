import 'package:cozy_findhouse/models/city.dart';
import 'package:cozy_findhouse/theme.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  City city;
  CityCard(this.city);
  // const CityCard({Key? key, required this.title, required this.image})
  // : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 120,
        height: 150,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            // NOTE : HEADER/TITLE
            Stack(
              children: [
                Image.asset(
                  city.imageUrl,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                // NOTE : POPULAR CITIES
                city.isPopular
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            width: 50,
                            height: 30,
                            decoration: BoxDecoration(
                                color: purpleColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(36))),
                            child: Padding(
                              padding: EdgeInsets.only(left: 8, bottom: 2),
                              child: Center(
                                  child: Image.asset(
                                'assets/icon_star.png',
                                width: 22,
                                height: 22,
                              )),
                            )),
                      )
                    : Container()
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(city.name, style: blackTextStyle.copyWith(fontSize: 16)),
            // NOTE: RECOMENDED SPACE
          ],
        ),
      ),
    );
  }
}

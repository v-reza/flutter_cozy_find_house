import 'package:cozy_findhouse/models/facilities.dart';
import 'package:cozy_findhouse/models/space.dart';
import 'package:cozy_findhouse/pages/error_page.dart';
import 'package:cozy_findhouse/theme.dart';
import 'package:cozy_findhouse/widgets/detail_photos.dart';
import 'package:cozy_findhouse/widgets/facilities_item.dart';
import 'package:cozy_findhouse/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space space;

  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl!,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: whiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // NOTE : TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    space.name!,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text.rich(TextSpan(
                                      text: '\$${space.price}',
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: ' / bulan',
                                            style: greyTextStyle.copyWith(
                                                fontSize: 16))
                                      ]))
                                ],
                              ),
                              Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      left: 2
                                    ),
                                    child: RatingItem(
                                      index: index,
                                      rating: space.rating!,
                                    ),
                                  );
                                }).toList(),
                              )
                            ]),
                      ),
                      // NOTE : MAIN FACILITIES
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text('Main Facilities',
                            style: regularTextStyle.copyWith(fontSize: 16)),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilitiesItem(Facilities(
                                id: 1,
                                title: ' kitchen',
                                imageUrl: 'assets/icon_kitchen.png',
                                totalFacilities: space.numberOfKitchen!)),
                            FacilitiesItem(Facilities(
                                id: 2,
                                title: ' bedroom',
                                imageUrl: 'assets/icon_bedroom.png',
                                totalFacilities: space.numberOfBedroom!)),
                            FacilitiesItem(Facilities(
                                id: 3,
                                title: ' Big Lemari',
                                imageUrl: 'assets/icon_cupboard.png',
                                totalFacilities: space.numberOfCupboard!))
                          ],
                        ),
                      ),
                      // NOTE : Photos
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text('Photos',
                            style: regularTextStyle.copyWith(fontSize: 16)),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Container(
                            height: 88,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: space.photos!.map((item) {
                                  return Container(
                                      margin: EdgeInsets.only(left: 24),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          child: DetailPhotos(imageUrl: item)));
                                }).toList()),
                          )),
                      // NOTE : LOCATION
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text('Location',
                            style: regularTextStyle.copyWith(fontSize: 16)),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${space.address}\n${space.city}\n${space.country}',
                              style: greyTextStyle.copyWith(fontSize: 14),
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(space.mapUrl!);
                              },
                              child: Image.asset(
                                'assets/btn_map.png',
                                width: 40,
                                height: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - (2 * edge),
                          // width: 327,
                          child: RaisedButton(
                            onPressed: () {
                              launchUrl(
                                  'https://wa.me/+6289652766610/?text=urlencodedtext');
                              // launchUrl('asdad');
                            },
                            color: purpleColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)),
                            child: Text(
                              'Book Now',
                              style: whiteTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  // Spacer(),
                  Image.asset(
                    'assets/btn_wishlist.png',
                    width: 40,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

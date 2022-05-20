import 'package:cozy_findhouse/models/city.dart';
import 'package:cozy_findhouse/models/space.dart';
import 'package:cozy_findhouse/models/tips.dart';
import 'package:cozy_findhouse/providers/space_providers.dart';
import 'package:cozy_findhouse/theme.dart';
import 'package:cozy_findhouse/widgets/bottom_navbar_item.dart';
import 'package:cozy_findhouse/widgets/city.dart';
import 'package:cozy_findhouse/widgets/space_card.dart';
import 'package:cozy_findhouse/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text('Mencari kosan yang cozy',
                  style: greyTextStyle.copyWith(fontSize: 16)),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text('Popular Cities',
                  style: regularTextStyle.copyWith(fontSize: 16)),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(City(
                        id: 1, name: 'Jakarta', imageUrl: 'assets/city1.png')),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'assets/city2.png',
                        isPopular: true)),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/city3.png',
                    )),
                    SizedBox(
                      width: 24,
                    ),
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpace(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space>? data = snapshot.data as List<Space>?;

                    int index = 0;

                    return Column(
                      children: data!.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(top: index == 1 ? 15 : 30),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
            // NOTE : TIPS & GUIDANCE
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Column(
                children: [
                  TipsCard(Tips(
                      tips: 'City Guidelines',
                      imageUrl: 'assets/tips1.png',
                      updated: 'Updated 20 Apr')),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(Tips(
                      tips: 'Jakarta Fairship',
                      imageUrl: 'assets/tips2.png',
                      updated: 'Updated 11 Dec')),
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8),
            // color: Colors.blue,
            borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_email.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

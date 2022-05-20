import 'package:cozy_findhouse/models/tips.dart';
import 'package:cozy_findhouse/theme.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  Tips tips;
  TipsCard(this.tips);
  // const TipsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.tips,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              tips.updated,
              style: greyTextStyle.copyWith(fontSize: 14),
            )
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.chevron_right),
          color: greyColor,
        ),
      ],
    );
  }
}

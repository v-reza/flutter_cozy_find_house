import 'package:cozy_findhouse/models/facilities.dart';
import 'package:cozy_findhouse/theme.dart';
import 'package:flutter/material.dart';

class FacilitiesItem extends StatelessWidget {
  Facilities facilities;

  FacilitiesItem(this.facilities);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          facilities.imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(TextSpan(
            text: facilities.totalFacilities.toString(),
            style: purpleTextStyle.copyWith(fontSize: 16),
            children: [
              TextSpan(
                  text: facilities.title,
                  style: greyTextStyle.copyWith(fontSize: 16))
            ]))
      ],
    );
  }
}

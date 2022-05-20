import 'package:flutter/material.dart';

class DetailPhotos extends StatelessWidget {
  final String imageUrl;
  DetailPhotos({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          imageUrl,
          width: 110,
          height: 88,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}

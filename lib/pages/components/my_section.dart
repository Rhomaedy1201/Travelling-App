import 'package:flutter/material.dart';
import 'package:travelling_app/utils/colors.dart';
import 'package:travelling_app/utils/my_text.dart';

class MySection extends StatelessWidget {
  String title;
  MySection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            color: blackC,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
          CustomText(
            text: "See All",
            color: greyC_800,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

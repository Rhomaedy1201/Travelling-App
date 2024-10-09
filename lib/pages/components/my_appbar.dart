import 'package:flutter/material.dart';
import 'package:travelling_app/utils/colors.dart';
import 'package:travelling_app/utils/my_space.dart';
import 'package:travelling_app/utils/my_text.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: secondaryC,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Location",
              color: greyC_800,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            spaceHeight(2),
            Row(
              children: [
                const Icon(Icons.location_on_rounded, size: 18, color: blackC),
                CustomText(
                  text: "New York, USA",
                  color: blackC,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                const Icon(Icons.keyboard_arrow_down_sharp,
                    size: 25, color: Colors.amber),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Stack(
          children: [
            const Icon(
              Icons.notifications,
              size: 28,
            ),
            Positioned(
              right: 4,
              top: 5,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: primaryC,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: whiteC, width: 1.5)),
              ),
            )
          ],
        ),
        spaceWidth(20),
      ],
    );
  }
}

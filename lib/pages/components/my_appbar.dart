import 'package:community_material_icon/community_material_icon.dart';
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
      shadowColor: greyC_100,
      surfaceTintColor: secondaryC,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Location",
              color: Colors.grey,
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
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Column(
          children: [
            spaceHeight(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: greyC_200, width: 1.5),
                      ),
                      child: const SizedBox(
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle:
                                TextStyle(color: greyC_800, fontSize: 17),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: blackC_400,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  spaceWidth(5),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: primaryC,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          CommunityMaterialIcons.filter_variant,
                          size: 28,
                          color: whiteC,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            spaceHeight(10)
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

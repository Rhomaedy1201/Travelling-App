import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/pages/components/my_appbar.dart';
import 'package:travelling_app/pages/components/my_section.dart';
import 'package:travelling_app/utils/categories_items.dart';
import 'package:travelling_app/utils/colors.dart';
import 'package:travelling_app/utils/my_space.dart';
import 'package:travelling_app/utils/my_text.dart';
import 'package:travelling_app/utils/top_trips_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int categoriesIndex = 0;
  TopTripsItems topTripsItems = TopTripsItems();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryC,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 130),
        child: MyAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceHeight(10),
            MySection(title: "Categories"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ListView.builder(
                  itemCount: CategoriesItems().items.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            categoriesIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.linear,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: whiteC,
                            border: Border.all(
                              color: categoriesIndex == index
                                  ? primaryC
                                  : greyC_200,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: categoriesIndex == index ? 10 : 20),
                            child: Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: categoriesIndex == index
                                        ? primaryC
                                        : whiteC,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    CategoriesItems().items[index]['icon'],
                                    color: categoriesIndex == index
                                        ? whiteC
                                        : primaryC,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          categoriesIndex == index ? 10 : 0),
                                  child: CustomText(
                                    text: CategoriesItems().items[index]
                                        ['title'],
                                    color: blackC_600,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            MySection(title: "Top Trips"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                height: 210,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 20),
                  itemCount: TopTripsItems().items.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var items = topTripsItems.items[index];
                    return Container(
                      width: 150,
                      height: 212,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: whiteC,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: greyC_100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: greyC_400,
                                        blurRadius: 6,
                                        offset: Offset(0, 4),
                                      )
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage(items['image']),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                spaceHeight(8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: items['title'],
                                      color: blackC,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amberAccent,
                                          size: 12,
                                        ),
                                        CustomText(
                                          text: items['rating'],
                                          color: blackC_400,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  color: greyC_800,
                                  size: 18,
                                ),
                                spaceWidth(2),
                                CustomText(
                                  text: items['location'],
                                  color: blackC_400,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      text: "\$${items['price']}",
                                      color: primaryC,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    spaceWidth(2),
                                    CustomText(
                                      text: "/Visit",
                                      color: blackC,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      items['favorite'] = !items['favorite'];
                                    });
                                  },
                                  child: Icon(
                                    items['favorite']
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 24,
                                    color: items['favorite']
                                        ? primaryC
                                        : blackC_400,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            MySection(title: "Group Trips"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 133,
                      decoration: BoxDecoration(
                        color: whiteC,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: greyC_100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 141,
                              height: 126,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/mountain_trip.png"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            spaceWidth(12),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Mountain Trip",
                                    color: blackC,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  CustomText(
                                    text: "Seelisburg",
                                    color: blackC_400,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_rounded,
                                        color: greyC_800,
                                        size: 18,
                                      ),
                                      spaceWidth(2),
                                      CustomText(
                                        text: "Norway",
                                        color: blackC_400,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 22,
                                        width: 70,
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: List.generate(5, (index) {
                                            return Positioned(
                                              left: index *
                                                  12, // Menentukan posisi gambar agar tumpang tindih
                                              child: Container(
                                                width: 18, // Lebar gambar
                                                height: 18, // Tinggi gambar
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: whiteC,
                                                      width: 1.5),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/user${index + 1}.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                      CustomText(
                                        text: "110+ Orders",
                                        color: blackC_400,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 7,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: greyC_200,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: LinearProgressIndicator(
                                            value: 0.8,
                                            backgroundColor: Colors.transparent,
                                            valueColor:
                                                const AlwaysStoppedAnimation<
                                                    Color>(primaryC),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: -17,
                                        child: CustomText(
                                          text: "80%",
                                          color: primaryC,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

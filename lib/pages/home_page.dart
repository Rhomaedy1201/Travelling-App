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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryC,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: MyAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                          hintStyle: TextStyle(color: greyC_800, fontSize: 17),
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
          spaceHeight(20),
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
                            color:
                                categoriesIndex == index ? primaryC : greyC_200,
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
                                  text: CategoriesItems().items[index]['title'],
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
                  return Container(
                    width: 150,
                    height: 212,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: whiteC,
                      borderRadius: BorderRadius.circular(20),
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
                                    image: AssetImage(
                                        TopTripsItems().items[index]['image']),
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
                                    text: TopTripsItems().items[index]['title'],
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
                                        text: TopTripsItems().items[index]
                                            ['rating'],
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
                                text: TopTripsItems().items[index]['location'],
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
                                    text:
                                        "\$${TopTripsItems().items[index]['price']}",
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
                                    TopTripsItems().items[index]['favorite'] =
                                        !TopTripsItems().items[index]
                                            ['favorite'];
                                  });
                                  print(
                                      TopTripsItems().items[index]['favorite']);
                                },
                                child: Icon(
                                  TopTripsItems().items[index]['favorite']
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 24,
                                  color: TopTripsItems().items[index]
                                          ['favorite']
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
        ],
      ),
    );
  }
}

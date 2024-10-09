import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:travelling_app/pages/components/my_appbar.dart';
import 'package:travelling_app/pages/components/my_section.dart';
import 'package:travelling_app/utils/categories_items.dart';
import 'package:travelling_app/utils/colors.dart';
import 'package:travelling_app/utils/my_space.dart';
import 'package:travelling_app/utils/my_text.dart';

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
          MySection(title: "Group Trips"),
        ],
      ),
    );
  }
}

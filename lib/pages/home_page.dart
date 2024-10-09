import 'package:flutter/material.dart';
import 'package:travelling_app/pages/components/my_appbar.dart';
import 'package:travelling_app/utils/colors.dart';
import 'package:travelling_app/utils/my_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryC,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: MyAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: greyC_200, width: 1.5),
                    ),
                    child: const TextField(
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
              ],
            ),
            CustomText(
              text: "Categories",
              color: blackC,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            )
          ],
        ),
      ),
    );
  }
}

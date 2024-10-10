import 'package:flutter/material.dart';
import 'package:travelling_app/pages/home_page.dart';
import 'package:travelling_app/utils/colors.dart';
import 'package:travelling_app/utils/my_space.dart';

class ButtomNavigationBarPage extends StatefulWidget {
  const ButtomNavigationBarPage({super.key});

  @override
  State<ButtomNavigationBarPage> createState() =>
      _ButtomNavigationBarPageState();
}

class _ButtomNavigationBarPageState extends State<ButtomNavigationBarPage> {
  int myCurrentIndex = 0;
  List<Widget> body = const [
    HomePage(),
    Center(child: Icon(Icons.message)),
    Center(child: Icon(Icons.favorite)),
    Center(child: Icon(Icons.person)),
  ];

  List itemsButtom = [
    Icons.home,
    Icons.location_history,
    Icons.favorite,
    Icons.person,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: body[myCurrentIndex],
      bottomNavigationBar: Container(
        width: double.infinity * 1,
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: whiteC,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: greyC_400,
                blurRadius: 12,
                offset: Offset(0, 0),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: itemsButtom.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      myCurrentIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          itemsButtom[index],
                          size: 25,
                          color: myCurrentIndex == index ? primaryC : greyC_800,
                        ),
                        myCurrentIndex == index ? spaceHeight(3) : Container(),
                        AnimatedContainer(
                          duration: const Duration(
                              milliseconds: 300), // Durasi animasi
                          curve: Curves.easeInOut, // Kurva animasi
                          width: myCurrentIndex == index
                              ? 20
                              : 15, // Ubah ukuran saat aktif
                          height: myCurrentIndex == index
                              ? 8
                              : 5, // Ubah ukuran saat aktif
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: myCurrentIndex == index ? primaryC : whiteC,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

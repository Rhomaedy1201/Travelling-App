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
    Icon(Icons.message),
    Icon(Icons.favorite),
    Icon(Icons.person),
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
      backgroundColor: secondaryC,
      body: Center(child: body[myCurrentIndex]),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: whiteC,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: greyC_400,
                blurRadius: 20,
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

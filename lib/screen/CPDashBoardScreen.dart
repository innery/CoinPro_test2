import 'package:flutter/material.dart';
import 'package:coinpro_prokit/fragment/CPHomeFragment.dart';
import 'package:coinpro_prokit/fragment/CPNotificationFragment.dart';
import 'package:coinpro_prokit/fragment/CPProfileFregment.dart';
import 'package:coinpro_prokit/model/CPModel.dart';
import 'package:coinpro_prokit/screen/CPSearchScreen.dart';
import 'package:coinpro_prokit/utils/CPColors.dart';
import 'package:coinpro_prokit/utils/CPDataProvider.dart';

class CPDashBoardScreen extends StatefulWidget {
  @override
  CPDashBoardScreenState createState() => CPDashBoardScreenState();
}

class CPDashBoardScreenState extends State<CPDashBoardScreen> {
  List<CPDataModel> tradeCrypto = getTradeCryptoDataModel();
  List<CPDataModel> tradeCryptoName = getTradeCryptoNameDataModel();

  int currentIndex = 0;
  List<Widget> tabs = [
    CPHomeFragment(),
    CPSearchScreen(),
    CPNotificationFragment(),
    CPProfileFragment(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(children: tabs, index: currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: CPPrimaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '', activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.person_search_outlined), label: '', activeIcon: Icon(Icons.person_search_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined), label: '', activeIcon: Icon(Icons.notifications_active_sharp)),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '', activeIcon: Icon(Icons.person)),
        ],
      ),
    );
  }
}

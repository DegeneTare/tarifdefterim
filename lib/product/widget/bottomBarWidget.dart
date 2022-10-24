import 'package:flutter/material.dart';
import 'package:yemektariflerim/features/home/view/pages/foodAddPage.dart';
import 'package:yemektariflerim/features/home/view/pages/home_view.dart';
import 'package:yemektariflerim/features/home/view/pages/loginPages/loginPage.dart';
import 'package:yemektariflerim/product/utility/project_network_image.dart';
import 'package:yemektariflerim/product/utility/project_utilitys.dart';
import 'package:yemektariflerim/product/widget/appBarWidget.dart';
import 'package:yemektariflerim/product/widget/textWidget.dart';

import '../../features/home/view/pages/categoriesPage.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final _bannerPageController = PageController();

  final List<Widget> _pages = [
    homeview(),
    const categoriesPage(),
    foodAdd(),
    loginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectedIndex != 0 && selectedIndex != 1
          ? null
          : appbarSettings(context),
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        selectedFontSize: 10,
        backgroundColor: projeColors().blackColor.withOpacity(0.7),
        currentIndex: selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: bottomItems,
      ),
    );
  }

  PreferredSize appbarSettings(BuildContext context) {
    return PreferredSize(
        child: appBarWidget(context),
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.06,
        ));
  }

  List<BottomNavigationBarItem> get bottomItems {
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
      BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined), label: "Kategoriler"),
      BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Tariflerim"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Hesabım"),
    ];
  }
}

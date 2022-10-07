import 'package:flutter/material.dart';
import 'package:yemektariflerim/features/home/view/tabbarPages/tabbar1_pages.dart';
import 'package:yemektariflerim/features/home/view/tabbarPages/tabbar2_pages.dart';
import 'package:yemektariflerim/product/widget/textWidget.dart';

import '../utility/project_utilitys.dart';

class mainTabbar extends StatelessWidget {
  const mainTabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
              child: AppBar(
                backgroundColor: Colors.black87,
                bottom: TabBar(tabs: [
                  Tab(
                      child: textWidget(
                    textFontSize: 17,
                    text: "Yeni Tarifler",
                    textCalor: projeColors().redColor,
                  )),
                  Tab(
                    child: textWidget(
                        textFontSize: 17,
                        text: "Popüler Tarifler",
                        textCalor: projeColors().redColor),
                  ),
                ]),
              ),
            ),
            body: const TabBarView(children: [
              tabbarPage1Widget(),
              tabbarPage2Widget(),
            ]),
          )),
    );
  }
}

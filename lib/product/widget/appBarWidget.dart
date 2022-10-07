import 'package:flutter/material.dart';
import 'package:yemektariflerim/product/widget/texfFieldWidget.dart';

import '../utility/project_utilitys.dart';

AppBar appBarWidget(BuildContext context) {
  final searchTextFieldControl12 = TextEditingController();
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * 0.07,
    elevation: 5,
    backgroundColor: Colors.black,
    leading: CircleAvatar(
      radius: 10.0,
      backgroundImage: const AssetImage("assets/png/yemekLogo.png"),
      backgroundColor: projeColors().transparentColor,
    ),
    title: SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: textfieldWidget(
          controller: searchTextFieldControl12,
          labeltext: "Arama Yapınız..",
          icon: Icons.search),
    ),
    actions: [
      Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width * 0.1,
        color: projeColors().transparentColor,
        child: const Icon(Icons.favorite_border, color: Colors.white),
      )
    ],
  );
}

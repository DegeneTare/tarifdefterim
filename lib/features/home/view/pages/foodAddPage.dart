import 'package:dropdown_button2/custom_dropdown_button2.dart';

import 'package:flutter/material.dart';

import 'package:yemektariflerim/product/widget/textWidget.dart';

import '../../../../product/utility/project_utilitys.dart';

class foodAdd extends StatefulWidget {
  foodAdd({Key? key}) : super(key: key);

  @override
  State<foodAdd> createState() => _foodAddState();
}

class _foodAddState extends State<foodAdd> {
  final tarifAdiController = TextEditingController();

  String? selectedValue;

  final malzemeTextControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: foodAddAppbar(),
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.96,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: projeColors().blackColor),
                  child: containerWidgetItems(),
                ),
                foodAddButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding foodAddButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.06,
        child: Center(
            child: textWidget(
          textFontSize: 19,
          text: "Tarifi Kaydet",
          textCalor: Colors.white.withOpacity(0.8),
        )),
        decoration: BoxDecoration(
            color: projeColors().redColor,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Padding containerWidgetItems() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const foodAddText(textName: "TARİF ADI:"),
          foodAddTextField(
              tarifAdiController: tarifAdiController, textName: "Tarif Adı"),
          const foodAddText(textName: "KAÇ KİŞİLİK:"),
          dropDownMenu(
              selectedValue: selectedValue, dropItems: KacKisilikitems),
          const foodAddText(textName: "HAZIRLAMA SÜRESİ"),
          dropDownMenu(
            dropItems: HazirlamaSuresiItems,
            selectedValue: selectedValue,
          ),
          const foodAddText(textName: "PİŞİRME SÜRESİ"),
          dropDownMenu(
            dropItems: PisirmeSuresiItems,
            selectedValue: selectedValue,
          ),
          const foodAddText(textName: "MALZEMELER"),
          foodAddTextField(
              tarifAdiController: malzemeTextControl,
              textName: "Malzeme Girin"),
          const foodAddText(textName: "HAZIRLANIŞI"),
          foodAddTextField(
              tarifAdiController: malzemeTextControl,
              textName: "Hazırlanışını yazın"),
          const foodAddText(textName: "KATEGORİ"),
          dropDownMenu(
            dropItems: KategoriItems,
            selectedValue: selectedValue,
          ),
        ],
      ),
    );
  }

  AppBar foodAddAppbar() {
    return AppBar(
      backgroundColor: projeColors().transparentColor,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_sharp,
            color: projeColors().redColor,
          )),
      title: Center(
          child: textWidget(
        textFontSize: 19,
        text: "Tarifinizi Girin",
        textCalor: projeColors().redColor,
      )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_book,
              color: projeColors().redColor,
            ))
      ],
    );
  }
}

class dropDownMenu extends StatefulWidget {
  dropDownMenu({
    Key? key,
    required this.selectedValue,
    required this.dropItems,
  }) : super(key: key);

  String? selectedValue;
  final List<String> dropItems;

  @override
  State<dropDownMenu> createState() => _dropDownMenuState();
}

class _dropDownMenuState extends State<dropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: CustomDropdownButton2(
          hint: 'Seçiniz',
          iconDisabledColor: projeColors().whiteColor,
          iconEnabledColor: projeColors().redColor,
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.white,
            ),
          ),
          value: widget.selectedValue,
          dropdownItems: widget.dropItems,
          onChanged: (value) {
            setState(() {
              widget.selectedValue = value;
            });
          }),
    );
  }
}

class foodAddText extends StatelessWidget {
  const foodAddText({
    Key? key,
    required this.textName,
  }) : super(key: key);

  final String textName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: textWidget(
        textFontSize: 15,
        text: textName,
        textCalor: projeColors().redColor.withOpacity(0.9),
      ),
    );
  }
}

class foodAddTextField extends StatelessWidget {
  const foodAddTextField({
    Key? key,
    required this.tarifAdiController,
    r,
    required this.textName,
  }) : super(key: key);

  final TextEditingController tarifAdiController;
  final String textName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextField(
        autofocus: false,
        maxLines: null,
        controller: tarifAdiController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            fillColor: Colors.transparent,
            filled: true,
            hintText: textName,
            hintStyle: TextStyle(
                fontSize: 15, color: projeColors().whiteColor.withOpacity(0.8)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(color: projeColors().whiteColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: projeColors().redColor),
            )),
      ),
    );
  }
}

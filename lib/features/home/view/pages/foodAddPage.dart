import 'dart:io';

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana/vexana.dart';
import 'package:yemektariflerim/core/init/network/product_network_manager.dart';
import 'package:yemektariflerim/features/home/cubit/cubit/home_cubit.dart';
import 'package:yemektariflerim/features/home/service/home_service.dart';
import 'package:yemektariflerim/features/home/view/pages/categoriesPage.dart';
import 'package:yemektariflerim/features/home/view/pages/foodDetailPage.dart';
import 'package:yemektariflerim/product/utility/image_upload.dart';
import 'package:yemektariflerim/product/widget/bottomBarWidget.dart';

import 'package:yemektariflerim/product/widget/textWidget.dart';

import '../../../../product/utility/project_utilitys.dart';

class foodAdd extends StatefulWidget {
  foodAdd({Key? key}) : super(key: key);

  @override
  State<foodAdd> createState() => _foodAddState();
}

class _foodAddState extends State<foodAdd> {
  final tarifAdiController = TextEditingController();
  final malzemeTextControl = TextEditingController();
  final isimTextController = TextEditingController();
  final hazirlanisiController = TextEditingController();

  var kackisilikController;
  var kategoriController;
  var haizirlanmaSuresiController;
  var pisirmeSuresiController;

  final GlobalKey<FormState> _formKey = GlobalKey();

  /*Future pickimage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    var kacKisilikitems1 = KacKisilikitems;
    return BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(HomeService(productNetworkManager())),
        child: Scaffold(
            appBar: _appbar(),
            backgroundColor: Colors.grey[900],
            body: Form(
              key: _formKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widgetTextItems(context),
                        const Padding(
                          padding: EdgeInsets.only(left: 35),
                          child: foodAddText(textName: 'Resim Yükleyin'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: BlocConsumer<HomeCubit, HomeState>(
                            listener: (context, state) {
                              if (state.isCompleted) {
                                SuccessAlertBoxCenter(
                                  buttonText: "Tamam",
                                  context: context,
                                  messageText: "Tarifiniz Başarıyla Kaydedildi",
                                );
                              }
                            },
                            builder: (context, state) {
                              return BlocBuilder<HomeCubit, HomeState>(
                                builder: (context, state) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BlocProvider(
                                        create: (context) => HomeCubit(
                                            HomeService(imageNetworkManager())),
                                        child: InkWell(
                                          child: Container(
                                            child: state.xfile != null
                                                ? Image.file(state.xfile!)
                                                : SizedBox(),
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color:
                                                    projeColors().whiteColor),
                                          ),
                                          onTap: () async {
                                            final image = await ImagePicker()
                                                .pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            if (image == null) return;
                                            setState(() {
                                              state.xfile = File(image.path);
                                            });
                                          },
                                        ),
                                      ),
                                      dividerVertival(),
                                      _button(context),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

  InkWell _button(BuildContext context) {
    return InkWell(
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
      onTap: () {
        if (_formKey.currentState?.validate() ?? false) {
          context.read<HomeCubit>().postProduct(
              tarifAdiController.text,
              isimTextController.text,
              kackisilikController.toString(),
              haizirlanmaSuresiController.toString(),
              pisirmeSuresiController.toString(),
              malzemeTextControl.text,
              hazirlanisiController.text,
              kategoriController.toString(),
              'https://im.haberturk.com/2019/12/04/ver1575459460/adana-kebap_2546270_810x458.jpg',
              5);
          BlocProvider(
            create: (context) => HomeCubit(HomeService(imageNetworkManager())),
            child: textWidget(
              textFontSize: 14,
              text: "eren",
              textCalor: Colors.yellow,
            ),
          );
        }
      },
    );
  }

  Container widgetTextItems(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.96,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: projeColors().blackColor),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const foodAddText(textName: 'TARİF ADI:'),
            foddTextField(
              hintText: 'Tarif Adı',
              TextEditingController: tarifAdiController,
            ),
            const foodAddText(textName: 'ADINIZ:'),
            foddTextField(
              hintText: 'Adınız',
              TextEditingController: isimTextController,
            ),
            foodAddText(textName: 'KAÇ KİŞİLİK:'),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: DropdownButtonFormField2(
                isDense: true,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                  )),
                  contentPadding: const EdgeInsets.symmetric(vertical: -5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                isExpanded: true,
                hint: Text(
                  'Lütfen Seçim Yapınız.',
                  style: TextStyle(
                      fontSize: 14,
                      color: projeColors().whiteColor.withOpacity(0.4)),
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: projeColors().redColor,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  color: projeColors().blackColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                items: KacKisilikitems.map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: fontSize().normal,
                          color: projeColors().whiteColor,
                        ),
                      ),
                    )).toList(),
                onChanged: (value) {
                  setState(() {
                    kackisilikController = value;
                  });
                  value = kackisilikController;
                },
              ),
              ////////////////////////////////////////////////////////////////////////////////////////
            ),
            const foodAddText(textName: 'HAZIRLANMA SÜRESİ:'),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: DropdownButtonFormField2(
                isDense: true,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                  )),
                  contentPadding: const EdgeInsets.symmetric(vertical: -5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                isExpanded: true,
                hint: Text(
                  'Lütfen Seçim Yapınız.',
                  style: TextStyle(
                      fontSize: 14,
                      color: projeColors().whiteColor.withOpacity(0.4)),
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: projeColors().redColor,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  color: projeColors().blackColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                items:
                    HazirlamaSuresiItems.map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: fontSize().normal,
                              color: projeColors().whiteColor,
                            ),
                          ),
                        )).toList(),
                onChanged: (value) {
                  setState(() {
                    haizirlanmaSuresiController = value;
                  });
                  value = haizirlanmaSuresiController;
                },
              ),
              ////////////////////////////////////////////////////////////////////////////////////////
            ),
            const foodAddText(textName: 'PİŞİRME SÜRESİ:'),
            ////////////////////////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: DropdownButtonFormField2(
                isDense: true,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                  )),
                  contentPadding: const EdgeInsets.symmetric(vertical: -5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                isExpanded: true,
                hint: Text(
                  'Lütfen Seçim Yapınız.',
                  style: TextStyle(
                      fontSize: 14,
                      color: projeColors().whiteColor.withOpacity(0.4)),
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: projeColors().redColor,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  color: projeColors().blackColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                items:
                    PisirmeSuresiItems.map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: fontSize().normal,
                              color: projeColors().whiteColor,
                            ),
                          ),
                        )).toList(),
                onChanged: (value) {
                  setState(() {
                    pisirmeSuresiController = value;
                  });
                  value = pisirmeSuresiController;
                },
              ),
              ////////////////////////////////////////////////////////////////////////////////////////
            ),
            const foodAddText(textName: 'MALZEMELER:'),
            foddTextField(
              hintText: 'Malzemeler',
              TextEditingController: malzemeTextControl,
            ),
            const foodAddText(textName: 'HAZIRLANIŞI:'),
            foddTextField(
              hintText: 'Hazırlanışı',
              TextEditingController: hazirlanisiController,
            ),
            const foodAddText(textName: 'KATEGORİ:'),

            ////////////////////////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: DropdownButtonFormField2(
                isDense: true,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                  )),
                  contentPadding: const EdgeInsets.symmetric(vertical: -5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                isExpanded: true,
                hint: Text(
                  'Lütfen Seçim Yapınız.',
                  style: TextStyle(
                      fontSize: 14,
                      color: projeColors().whiteColor.withOpacity(0.4)),
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: projeColors().redColor,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  color: projeColors().blackColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                items: KategoriItems.map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: fontSize().normal,
                          color: projeColors().whiteColor,
                        ),
                      ),
                    )).toList(),
                onChanged: (value) {
                  setState(() {
                    kategoriController = value;
                  });
                  value = kategoriController;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appbar() {
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
            )),
      ],
    );
  }
}

class foddTextField extends StatelessWidget {
  const foddTextField({
    Key? key,
    required this.hintText,
    required this.TextEditingController,
  }) : super(key: key);

  final TextEditingController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        style: TextStyle(
            color: projeColors().whiteColor, fontSize: fontSize().normal),
        autofocus: false,
        maxLines: null,
        controller: TextEditingController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            fillColor: Colors.transparent,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 15, color: projeColors().whiteColor.withOpacity(0.4)),
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

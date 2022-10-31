import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon/icon.dart';
import 'package:yemektariflerim/features/home/cubit/cubit/login_cubit.dart';
import 'package:yemektariflerim/features/home/view/pages/loginPages/registerPage.dart';
import 'package:yemektariflerim/product/utility/project_network_image.dart';
import 'package:yemektariflerim/product/utility/project_utilitys.dart';
import 'package:yemektariflerim/product/widget/bottomBarWidget.dart';
import 'package:yemektariflerim/product/widget/texfFieldWidget.dart';
import 'package:yemektariflerim/product/widget/textWidget.dart';

class loginPage extends StatelessWidget {
  loginPage({Key? key}) : super(key: key);

  final _emailLoginController = TextEditingController();
  final _passwordLoginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Form(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Column(
                    children: [
                      loginPageImage(context),
                      textWidget(
                          textFontSize: 25,
                          text: "Hoşgeldiniz ",
                          textCalor: projeColors().redColor),
                      textFieldLoginWidget(
                          textController: _emailLoginController,
                          textFieldLogin: "E-mail"),
                      SifreTextFieldLoginWidget(
                          emailLoginController: _passwordLoginController,
                          textFieldLogin: "Şifre"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          InkWell(
                              child: Text(
                            "Şifremi Unuttum",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                          )),
                        ],
                      ),
                      loginButton(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          facebookButton(context),
                          googleButton(context),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bir hesabınız yok mu?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: projeColors().blackColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => registerPage()),
                                  );
                                },
                                child: Text("Kayıt ol",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: projeColors().blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3, top: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomBar()),
                            );
                          },
                          child: Text("Üye olmadan devam et",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: projeColors().blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding loginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.06,
        child: Center(
            child: textWidget(
          textFontSize: 19,
          text: "Giriş Yap",
          textCalor: Colors.white.withOpacity(0.8),
        )),
        decoration: BoxDecoration(
            color: projeColors().redColor,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Padding facebookButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 15),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.06,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.facebook),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: textWidget(
                textFontSize: 15,
                text: "Facebook",
                textCalor: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        )),
        decoration: BoxDecoration(
            color: projeColors().blue, borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  Padding googleButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.06,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                maxRadius: 15,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'assets/png/google.png',
                )),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: textWidget(
                textFontSize: 15,
                text: "Google",
                textCalor: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        )),
        decoration: BoxDecoration(
            color: projeColors().redColor,
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  ClipRRect loginPageImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Image.asset(
          'assets/png/loginImage.png',
        ),
      ),
    );
  }
}

class textFieldLoginWidget extends StatelessWidget {
  const textFieldLoginWidget({
    Key? key,
    required this.textController,
    required this.textFieldLogin,
  }) : super(key: key);

  final textController;
  final String textFieldLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        validator: ((value) =>
            value!.length > 5 ? null : 'Minimum 5 karakterli olmalı.'),
        style: TextStyle(color: Colors.black),
        autofocus: false,
        maxLines: 1,
        controller: textController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            fillColor: Colors.white,
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            filled: true,
            hintText: textFieldLogin,
            hintStyle: TextStyle(
                fontSize: 15, color: projeColors().redColor.withOpacity(0.8)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: projeColors().blackColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: projeColors().blue),
            )),
      ),
    );
  }
}

class SifreTextFieldLoginWidget extends StatelessWidget {
  const SifreTextFieldLoginWidget({
    Key? key,
    required TextEditingController emailLoginController,
    required this.textFieldLogin,
  })  : _emailLoginController = emailLoginController,
        super(key: key);

  final TextEditingController _emailLoginController;
  final String textFieldLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        validator: ((value) =>
            value!.length > 5 ? null : 'Minimum 5 karakterli olmalı.'),
        style: TextStyle(color: Colors.black),
        autofocus: false,
        maxLines: 1,
        controller: _emailLoginController,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            fillColor: Colors.white,
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            filled: true,
            hintText: textFieldLogin,
            hintStyle: TextStyle(
                fontSize: 15, color: projeColors().redColor.withOpacity(0.8)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: projeColors().blackColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: projeColors().blue),
            )),
      ),
    );
  }
}

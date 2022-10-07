import 'package:flutter/material.dart';
import 'package:yemektariflerim/features/home/view/pages/loginPages/loginPage.dart';
import 'package:yemektariflerim/product/utility/project_network_image.dart';
import 'package:yemektariflerim/product/widget/bottomBarWidget.dart';
import 'package:yemektariflerim/product/widget/textWidget.dart';

class registerPage extends StatefulWidget {
  registerPage({Key? key}) : super(key: key);

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  bool value = false;
  final _emailLoginController = TextEditingController();

  final _nameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textWidget(
                  textFontSize: 20,
                  text: "Hesap Oluşturun",
                  textCalor: projeColors().redColor),
              sizedbox(context),
              textFieldLoginWidget(
                  emailLoginController: _nameController,
                  textFieldLogin: "Ad-Soyad"),
              sizedbox(context),
              textFieldLoginWidget(
                  emailLoginController: _emailLoginController,
                  textFieldLogin: "E-mail"),
              sizedbox(context),
              textFieldLoginWidget(
                  emailLoginController: _passwordController,
                  textFieldLogin: "Şifre"),
              sizedbox(context),
              textFieldLoginWidget(
                  emailLoginController: _passwordController,
                  textFieldLogin: "Şifre Tekrar"),
              sizedbox(context),
              Row(
                children: [
                  Checkbox(
                    value: this.value,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  const textWidget(
                    textFontSize: 15,
                    text: "Şartları ve koşulları kabul ediyorum.",
                    textCalor: Colors.black,
                  )
                ],
              ), //
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Center(
                      child: textWidget(
                    textFontSize: 19,
                    text: "Kayıt Ol",
                    textCalor: Colors.white.withOpacity(0.8),
                  )),
                  decoration: BoxDecoration(
                      color: projeColors().redColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const textWidget(
                      textFontSize: 15,
                      text: "Zaten bir Hesabınız var mı?",
                      textCalor: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginPage()),
                          );
                        },
                        child: Text("Giriş yap",
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
            ],
          ),
        ),
      ),
    );
  }

  SizedBox sizedbox(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.01,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:yemektariflerim/features/home/model/product_model.dart';
import 'package:yemektariflerim/product/utility/project_network_image.dart';
import 'package:yemektariflerim/product/utility/project_utilitys.dart';
import 'package:yemektariflerim/product/widget/textWidget.dart';

class productDetailPage extends StatelessWidget {
  final ProductModel item;

  const productDetailPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Stack(
                children: [
                  bannerImage(context),
                  banner_icon(context),
                ],
              ),
            ),
            BaslikContainer(context),
            HazirlamaBilgileriContainer(context),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                color: projeColors().blackColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    malzemelerText(),
                    dividerHorizontal(),
                    malzemelerItems(context),
                    hazirlanisiText(),
                    dividerHorizontal(),
                    hazirlanisiItems(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding hazirlanisiItems(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: Text(item.hazirlanisi.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: projeColors().whiteColor)),
    );
  }

  Padding hazirlanisiText() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: textWidget(
          textFontSize: 15,
          text: "Hazırlanışı: ",
          textCalor: projeColors().whiteColor),
    );
  }

  Padding malzemelerItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Text(item.malzemeler.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: projeColors().whiteColor)),
    );
  }

  Padding malzemelerText() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: textWidget(
          textFontSize: 15,
          text: "Malzemeler: ",
          textCalor: projeColors().whiteColor),
    );
  }

  Padding banner_icon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            iconSize: 25,
            color: projeColors().redColor,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.share_sharp),
                color: projeColors().redColor,
                iconSize: 25,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
                color: projeColors().redColor,
                iconSize: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container BaslikContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.grey[900]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(
                    textFontSize: 20,
                    text: item.title.toString(),
                    textCalor: projeColors().whiteColor),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: ratingBar(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: textWidget(
                    textFontSize: 15,
                    text: item.name.toString(),
                    textCalor: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding HazirlamaBilgileriContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(color: Colors.grey[800]),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Kaç Kişilik",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: projeColors().whiteColor)),
                    dividerHorizontal(),
                    Text(item.kacKisilik.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: projeColors().whiteColor)),
                  ],
                ),
                dividerVertival(),
                Column(
                  children: [
                    Text("Hazırlama",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: projeColors().whiteColor)),
                    dividerHorizontal(),
                    Text(item.hazirlanmaSuresi.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: projeColors().whiteColor)),
                  ],
                ),
                dividerVertival(),
                Column(
                  children: [
                    Text("Pişirme",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: projeColors().whiteColor)),
                    dividerHorizontal(),
                    Text(item.pisirmeSuresi.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: projeColors().whiteColor)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RatingBar ratingBar() {
    return RatingBar(
      itemSize: 20,
      onRatingUpdate: (double value) {},
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.favorite,
          color: Colors.orange[500],
        ),
        half: Icon(Icons.favorite_outline),
        empty: Icon(
          Icons.favorite_border,
          color: Colors.orange,
        ),
      ),
    );
  }

  Container bannerImage(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: projectNetworkImage.network(src: item.img.toString()),
    );
  }
}

Container dividerVertival() {
  return Container(
    height: 30.0,
    width: 1.5,
    color: Colors.white30,
    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
  );
}

Container dividerHorizontal() {
  return Container(
    height: 2,
    width: 50,
    color: projeColors().redColor,
    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yemektariflerim/features/home/cubit/cubit/home_cubit.dart';
import 'package:yemektariflerim/features/home/view/pages/home_view.dart';
import 'package:yemektariflerim/product/widget/loading_center.dart';
import 'package:yemektariflerim/product/widget/textWidget.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  final _bannerPageController = PageController();

  @override
  Widget build(BuildContext context) {
    // TabController _mainPageTabController = TabController(length: 3, vsync: this);
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
          child: Column(
            children: [
              _bannerPageView(bannerPageController: _bannerPageController),
              //    IndicatorSettingView(bannerPageController: _bannerPageController),
              //  Expanded(child: Container(child: const mainTabbar()))
            ],
          ),
        ));
  }
}

class IndicatorSettingView extends StatelessWidget {
  const IndicatorSettingView({
    Key? key,
    required PageController bannerPageController,
  })  : _bannerPageController = bannerPageController,
        super(key: key);

  final PageController _bannerPageController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        if (state.items == null) return SizedBox.shrink();
        int? itemLenght = state.items?.length.toInt();
        itemLenght = itemLenght! - itemLenght + 3;
        return SmoothPageIndicator(
          controller: _bannerPageController,
          count: itemLenght,
          effect: const SwapEffect(
              spacing: 5.0,
              dotWidth: 10,
              dotHeight: 10,
              paintStyle: PaintingStyle.stroke,
              strokeWidth: 1,
              dotColor: Colors.redAccent,
              activeDotColor: Colors.redAccent),
        );
      },
    );
  }
}

class _bannerPageView extends StatelessWidget {
  const _bannerPageView({
    Key? key,
    required PageController bannerPageController,
  })  : _bannerPageController = bannerPageController,
        super(key: key);

  final PageController _bannerPageController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(),
              child: PageView.builder(
                controller: _bannerPageController,
                itemBuilder: (context, index) {
                  final _items = state.items?[index];
                  if (_items == null) return const SizedBox.shrink();

                  return Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(_items.img.toString()),
                              fit: BoxFit.fill,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 180),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFF0E3311).withOpacity(0.2)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              textWidget(
                                textFontSize: 15,
                                text: _items.name.toString(),
                                textCalor: Colors.white,
                              ),
                              textWidget(
                                textFontSize: 20,
                                text: _items.title.toString(),
                                textCalor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: (3),
              ),
            ),
          ],
        );
      },
    );
  }
}

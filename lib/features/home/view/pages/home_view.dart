import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:yemektariflerim/features/home/model/product_model.dart';
import 'package:yemektariflerim/features/home/service/home_service.dart';

import 'package:yemektariflerim/core/init/network/product_network_manager.dart';
import 'package:yemektariflerim/product/widget/loading_center.dart';
import 'package:yemektariflerim/product/widget/shimmerWidget/shimmerState.dart';

import 'package:yemektariflerim/product/widget/tabbarPage_widget.dart';

import '../../../../product/widget/shimmerWidget/shimmer.dart';
import '../../../../product/widget/textWidget.dart';
import '../../cubit/cubit/home_cubit.dart';

class homeview extends StatelessWidget {
  homeview({
    Key? key,
  }) : super(key: key);

  final _bannerPageController = PageController();

  @override
  Widget build(BuildContext context) {
    bool _enabled = true;
    return BlocProvider(
      create: (context) => HomeCubit(HomeService(productNetworkManager())),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state.items == null) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: shimmerState(),
                    );
                  }

                  int? itemLenght = state.items?.length.toInt();
                  itemLenght = itemLenght! - itemLenght + 3;

                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 5),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: const BoxDecoration(),
                    child: PageView.builder(
                      controller: _bannerPageController,
                      itemBuilder: (context, index) {
                        final _items = state.items?[index];
                        if (_items == null) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                          );
                        }

                        return Stack(
                          children: [
                            shimmerState(),
                            bannerImage(context, _items),
                            bannerTexts(_items),
                            indicator()
                          ],
                        );
                      },
                      itemCount: (itemLenght),
                    ),
                  );
                },
              ),
              const mainTabbar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget shimmerWidget() {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) {
        return state.isLoading ?? false;
      },
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state ? 1 : 0,
          duration: context.durationLow,
          child: shimmerWidger(
            enabled: state,
          ),
        );
      },
    );
  }

  Padding bannerTexts(ProductModel _items) {
    return Padding(
      padding: const EdgeInsets.only(top: 180),
      child: Container(
        decoration:
            BoxDecoration(color: const Color(0xFF0E3311).withOpacity(0.2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }

  Container bannerImage(BuildContext context, ProductModel _items) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(_items.img.toString()),
            fit: BoxFit.fill,
          )),
    );
  }

  Center indicator() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Container(
          // color: Colors.black.withOpacity(0.3),
          child: SmoothPageIndicator(
            controller: _bannerPageController,
            count: 3,
            effect: const SwapEffect(
                spacing: 5.0,
                dotWidth: 10,
                dotHeight: 10,
                paintStyle: PaintingStyle.stroke,
                strokeWidth: 2,
                dotColor: Colors.redAccent,
                activeDotColor: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}

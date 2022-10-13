import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:yemektariflerim/features/home/model/categories_model.dart';
import 'package:yemektariflerim/product/utility/project_network_image.dart';
import 'package:yemektariflerim/product/widget/shimmerWidget/shimmerList.dart';
import 'package:yemektariflerim/product/widget/shimmerWidget/shimmerState.dart';
import 'package:yemektariflerim/product/widget/textWidget.dart';

import '../../../../core/init/network/product_network_manager.dart';
import '../../../../product/widget/loading_center.dart';
import '../../cubit/cubit/home_cubit.dart';
import '../../service/home_service.dart';

class categoriesPage extends StatelessWidget {
  const categoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeService(productNetworkManager())),
      child: Scaffold(
          backgroundColor: Colors.black87,
          body: Column(
            children: [
              Expanded(child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state.items == null) {
                    return shimmerList();
                  }
                  return GridView.builder(
                      itemCount: state.categoriesItem?.length ?? 2,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.5,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 10),
                      itemBuilder: (BuildContext context, int index) {
                        final _CategoriesItem = state.categoriesItem?[index];
                        if (_CategoriesItem == null)
                          return const SizedBox.shrink();

                        return Card(
                            child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _categoriesTitle(context, _CategoriesItem),
                              Expanded(
                                child:
                                    _categoriesImage(context, _CategoriesItem),
                              ),
                            ],
                          ),
                        ));
                      });
                },
              )),
            ],
          )),
    );
  }

  SizedBox _categoriesTitle(
      BuildContext context, CategoriesModel _CategoriesItem) {
    return SizedBox(
      width: 100,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: textWidget(
              textFontSize: 15,
              text: _CategoriesItem.title.toString(),
              textCalor: Colors.black),
        ),
      ),
    );
  }

  Container _categoriesImage(
      BuildContext context, CategoriesModel _CategoriesItem) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(20),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.35,
      child: projectNetworkImage.network(src: _CategoriesItem.image.toString()),
    );
  }
}

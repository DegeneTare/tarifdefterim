import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemektariflerim/core/init/network/product_network_manager.dart';
import 'package:yemektariflerim/features/home/cubit/cubit/home_cubit.dart';
import 'package:yemektariflerim/features/home/model/categories_model.dart';
import 'package:yemektariflerim/features/home/model/product_model.dart';
import 'package:yemektariflerim/features/home/service/home_service.dart';
import 'package:yemektariflerim/features/home/view/pages/foodDetailPage.dart';
import 'package:yemektariflerim/features/home/view/tabbarPages/tabbar1_pages.dart';
import 'package:yemektariflerim/product/widget/shimmerWidget/shimmerList.dart';
import 'package:yemektariflerim/product/widget/shimmerWidget/shimmerState.dart';

class ListCategories extends StatelessWidget {
  final CategoriesModel kategoriItem;
  const ListCategories({Key? key, required this.kategoriItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeService(productNetworkManager())),
      child: Scaffold(body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          context
              .read<HomeCubit>()
              .fetchSelectedProducts(kategoriItem.title.toString());
          if (state.selectedItems == null) {
            return const shimmerList();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      itemCount: state.selectedItems?.length ?? 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 0.1,
                              crossAxisSpacing: 5),
                      itemBuilder: (BuildContext context, int index) {
                        final _item = state.selectedItems?[index];
                        if (_item == null) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: const shimmerState(),
                          );
                        }
                        return foodCardWidget(
                          item: _item,
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      productDetailPage(item: _item))),
                        );
                      }),
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemektariflerim/features/home/cubit/cubit/home_cubit.dart';
import 'package:yemektariflerim/features/home/view/pages/foodDetailPage.dart';
import 'package:yemektariflerim/features/home/view/tabbarPages/tabbar1_pages.dart';
import 'package:yemektariflerim/product/widget/shimmerWidget/shimmerState.dart';

import '../../../../product/widget/shimmerWidget/shimmerList.dart';

class tabbarPage2Widget extends StatelessWidget {
  const tabbarPage2Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.sortItems == null) {
          return const shimmerList();
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      itemCount: state.sortItems?.length ?? 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 0.1,
                              crossAxisSpacing: 5),
                      itemBuilder: (BuildContext context, int index) {
                        final _item = state.sortItems?[index];
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
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemektariflerim/features/home/cubit/cubit/home_cubit.dart';
import 'package:yemektariflerim/features/home/model/product_model.dart';
import 'package:yemektariflerim/features/home/view/pages/categoriesPage.dart';
import 'package:yemektariflerim/product/widget/shimmerWidget/shimmerList.dart';
import 'package:yemektariflerim/product/widget/shimmerWidget/shimmerState.dart';
import '../pages/foodDetailPage.dart';

class tabbarPage1Widget extends StatelessWidget {
  const tabbarPage1Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.items == null) {
          return const shimmerList();
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      itemCount: state.items?.length ?? 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 0.1,
                              crossAxisSpacing: 5),
                      itemBuilder: (BuildContext context, int index) {
                        final _item = state.items?[index];
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

class foodCardWidget extends StatelessWidget {
  const foodCardWidget({
    Key? key,
    required ProductModel? item,
    this.press,
  })  : _item = item,
        super(key: key);

  final ProductModel? _item;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                children: [
                  Container(
                    child: Image.network(_item?.img ?? ''),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  //     ratingBar(iconsize: 15),
                  Text(
                    _item?.title ?? '',
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontSize: 17, color: Colors.white),
                  ),
                  Text(
                    _item?.name ?? '',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 14,
                          color: Colors.white60,
                        ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

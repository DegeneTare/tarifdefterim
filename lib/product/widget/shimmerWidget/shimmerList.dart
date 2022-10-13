import 'package:flutter/material.dart';
import 'package:yemektariflerim/product/widget/shimmerWidget/shimmerState.dart';

class shimmerList extends StatelessWidget {
  const shimmerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 0.1,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const shimmerState(),
          ),
        );
      },
    );
  }
}

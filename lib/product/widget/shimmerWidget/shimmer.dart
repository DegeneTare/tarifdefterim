import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class shimmerWidger extends StatelessWidget {
  final bool enabled;
  const shimmerWidger({Key? key, required this.enabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: (Colors.grey[300])!,
        enabled: enabled,
        child: Container(
          color: Colors.grey,
        ));
  }
}

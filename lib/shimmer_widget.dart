import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  late final double width;
  late final double height;
  late final  ShapeBorder shapeBorder;


  ShimmerWidget.fromRectangular({this.width=double.infinity, required this.height,required this.shapeBorder});
  ShimmerWidget.circle({required this.width,required this.height, this.shapeBorder=const CircleBorder()});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(child: Container(width: width,height: height,

      decoration: ShapeDecoration(shape: shapeBorder,color: Colors.grey),),
        baseColor: Colors.grey[400]!, highlightColor: Colors.grey[300]!);
  }
}

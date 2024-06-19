import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContainerLoading extends StatelessWidget {
  final double? width;
  final double? height;
  const ContainerLoading({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 50,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

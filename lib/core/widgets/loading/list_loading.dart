import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListLoading extends StatelessWidget {
  final double? height;
  const ListLoading({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * .5,
      height: MediaQuery.of(context).size.height * .5,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: height ?? 50,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          );
        },
      ),
    );
  }
}

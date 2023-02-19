import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class QuestionShimmer extends StatelessWidget {
  const QuestionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    var answer = Container(
      width: double.infinity,
      height: 46,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6)
      ),
    );

    return Shimmer.fromColors(
      baseColor: Theme.of(context).splashColor.withOpacity(.3),
      highlightColor: Colors.white10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            height: 16,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4)
            ),
          ),
          Container(
            width: 200,
            height: 16,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4)
            ),
          ),
          answer,
          answer,
          answer,
          answer
        ],
      ),
    );
  }
}
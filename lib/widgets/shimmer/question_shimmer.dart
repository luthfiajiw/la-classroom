import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class QuestionShimmer extends StatelessWidget {
  const QuestionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    var answer = Container(
      width: double.infinity,
      height: 50,
      color: Theme.of(context).scaffoldBackgroundColor,
    );

    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.blueGrey.withOpacity(.5),
      child: Column(
        children: [
          answer,
          const SizedBox(height: 16,),
          answer,
          const SizedBox(height: 16,),
          answer,
          const SizedBox(height: 16,),
          answer,
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}
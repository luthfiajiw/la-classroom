
import 'package:flutter/material.dart';

class BackgroundQuestion extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  const BackgroundQuestion({super.key, required this.child, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: gradient == null ? Theme.of(context).primaryColor : null,
              gradient: gradient
            ),
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
        ),
        Positioned(
          child: child
        )
      ],
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white.withOpacity(.1);
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * .2, 0);
    path.lineTo(0, size.height * .4);
    path.close();

    final path1 = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width * .8, 0);
    path.lineTo(size.width * .27, size.height);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }}
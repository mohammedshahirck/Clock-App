import 'dart:math';
import 'package:clock_app/controller/clock_view/clock_view.dart';
import 'package:clock_app/view/clock_view/widget/clock_custom_paint.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClockView extends StatelessWidget {
  const ClockView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ClockViewProvider>(context, listen: false).clock();
    });
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: Consumer<ClockViewProvider>(
          builder: (context, value, child) {
            return CustomPaint(
              painter: ClockPainter(value.currentTime),
            );
          },
        ),
      ),
    );
  }
}

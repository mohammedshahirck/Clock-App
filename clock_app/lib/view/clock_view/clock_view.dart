import 'dart:async';
import 'dart:math';
import 'package:clock_app/controller/clock_view/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      Provider.of<ClockViewProvider>(context, listen: false).updatetime();
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
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

class ClockPainter extends CustomPainter {
  final DateTime dateTime;

  ClockPainter(this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = const Color.fromARGB(255, 60, 81, 131);
    var outlineBrush = Paint()
      ..color = const Color.fromARGB(255, 146, 152, 190)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    var centerBrush = Paint()..color = const Color.fromARGB(255, 146, 152, 190);
    var secLegBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    var minLegBrush = Paint()
      ..shader = const RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    var hourBrush = Paint()
      ..shader = const RadialGradient(colors: [Colors.pink, Colors.lightBlue])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawCircle(center, radius - 30, fillBrush);
    canvas.drawCircle(center, radius - 30, outlineBrush);

    var minlegX = centerX + 70 * cos(dateTime.minute * 6 * pi / 180);
    var minlegY = centerY + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minlegX, minlegY), minLegBrush);
    var hourlegX = centerX + 70 * cos(dateTime.hour * 30 * pi / 180);
    var hourlegY = centerY + 50 * sin(dateTime.hour * 30 * pi / 180);
    canvas.drawLine(center, Offset(hourlegX, hourlegY), hourBrush);
    var seclegX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var seclegY = centerY + 70 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(seclegX, seclegY), secLegBrush);
    canvas.drawCircle(center, 5, centerBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

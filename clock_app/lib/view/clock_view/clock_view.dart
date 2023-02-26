import 'dart:math';
import 'package:clock_app/controller/clock_view/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClockView extends StatelessWidget {
  const ClockView({super.key});

  @override
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
    var dashBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;
    canvas.drawCircle(center, radius - 45, fillBrush);
    canvas.drawCircle(center, radius - 45, outlineBrush);

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
    var outerCircleRadius = radius - 15;
    var innerCircleRadius = radius - 28;
    for (double i = 0; i < 360; i += 30) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

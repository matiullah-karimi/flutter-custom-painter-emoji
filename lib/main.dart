import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomPaint(
          painter: ShapePainter(),
          child: Container(),
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.yellow[800]
      ..strokeWidth = 50
      ..strokeCap = StrokeCap.round;

    Offset startingPoint = Offset(100, (size.height / 2));
    Offset endingPoint = Offset(size.width - 100, size.height / 2);

    canvas.drawLine(startingPoint, endingPoint, paint);

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 100, paint);

    // Eyes
    var paint2 = Paint()
      ..color = Colors.white
      ..strokeWidth = 100
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(
        Offset((size.width / 2) - 40, (size.height / 2) - 30), 15, paint2);
    canvas.drawCircle(
        Offset((size.width / 2) + 40, (size.height / 2) - 30), 15, paint2);

    // Nose and lips
    var paint3 = Paint()
      ..color = Colors.white
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(
        Offset((size.width / 2), (size.height / 2) + 45), 30, paint2);

    // Lips
    canvas.drawLine(
        Offset(180, (size.height / 2) + 35),
        Offset((size.width / 2) + 25, (size.height / 2) + 35),
        paint3
          ..color = Colors.yellow[800]
          ..strokeWidth = 40);

    // Nose
    canvas.drawLine(
        Offset(size.width / 2, (size.height / 2) + 30),
        Offset(size.width / 2, (size.height / 2) - 10),
        paint3
          ..color = Colors.white
          ..strokeWidth = 18);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

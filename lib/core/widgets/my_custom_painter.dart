import 'package:flutter/material.dart';

class FirstCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xffDDCDFF)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.3, 0);
    path0.quadraticBezierTo(size.width * 0.1635333, size.height * 0.0851177,
        size.width * 0.1966667, size.height * 0.2757651);
    path0.cubicTo(size.width * 0.2312333, size.height * 0.6003616, size.width,
        size.height * 0.8031811, size.width, size.height * 0.5812977);
    // path0.quadraticBezierTo(size.width,size.height*0.8822310,size.width,size.height*0.5932736);
    path0.lineTo(size.width, size.height * 0.0028027);
    path0.lineTo(size.width, size.height * 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SecondCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xffEA94D7)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.0639574);
    path0.quadraticBezierTo(size.width * 0.0861250, size.height * 0.0317965,
        size.width * 0.3857750, size.height * 0.0580017);
    path0.cubicTo(
        size.width * 0.5958750,
        size.height * 0.0772422,
        size.width * 0.6347000,
        size.height * 0.2993414,
        size.width * 0.5266500,
        size.height * 0.3007147);
    path0.quadraticBezierTo(size.width * 0.0536000, size.height * 0.3878503, 0,
        size.height * 0.5817685);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

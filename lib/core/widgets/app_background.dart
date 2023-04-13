import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/widgets/my_custom_painter.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100.r),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 253, 155, 155),
                Color.fromARGB(255, 255, 255, 255),
              ],
            )),
          ),
          
          CustomPaint(
            foregroundPainter: SecondCustomPainter(),
            size: Size(MediaQuery.of(context).size.width,
                (500.r * 1.7839999389648438).toDouble()),
          ),
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                (500.r * 2.3786665852864584).toDouble()),
            painter: FirstCustomPainter(),
          ),
          Positioned(right: 5.r,left: 5.r,
            top: MediaQuery.of(context).size.height/2.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            RotationTransition(
                turns: const AlwaysStoppedAnimation(15 / 360),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: const Color(0xffF49D9D)),
                  width: 100.r,
                  height: 100.r,
                )),
            CircleAvatar(
              radius: 55.r,
              backgroundColor: const Color(0xffFFD593),
            )
              ],
            ),
          ),
          Center(
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(15 / 1000),
                child: Container(
                  margin: EdgeInsets.only(top: 200.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: const Color(0xffF49D9D).withOpacity(0.5)),
                  width: 80.r,
                  height: 80.r,
                )),
          ),
          Center(child: child)
        ],
      ),
    );
  }
}

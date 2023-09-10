// import 'dart:math';

// import 'package:flutter/material.dart';

// class Circularprogress extends CustomPainter{
//   final strokeCircle=13.0;
//   double currentprogress;

//   Circularprogress(this.currentprogress);
//  @override
//   void paint(Canvas canvas, Size size) {
//     Paint circle=Paint()
//     ..strokeWidth=strokeCircle
//     ..color=Colors.black
//     ..style=PaintingStyle.stroke;

//     Offset center=Offset(size.width/2,size.height/2);
//     double redius=150;
//     canvas.drawCircle(center, redius, circle);

// Paint animationArc=Paint()
// ..strokeWidth=strokeCircle
// ..color=Colors.purpleAccent
// ..style=PaintingStyle.stroke
// ..strokeCap=StrokeCap.round;

// double angle=2*pi*(currentprogress/100);
// canvas.drawArc(Rect.fromCircle(center: center, radius: redius),
//  pi/2, angle, false,animationArc );
//   } 

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return true;
//   }
// }
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ClipPathApp(), debugShowCheckedModeBanner: false,));

class ClipPathApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: BottomClipper(),
        child: Container(
          height: 200.0,
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);

    var firstControlPoint = Offset(size.width/4, size.height);
    var firstEndPoint = Offset(size.width/2, size.height - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width/4*3, size.height - 100);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }


}

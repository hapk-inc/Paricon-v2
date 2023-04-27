import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Image.asset('assets/pi.png', fit: BoxFit.fitWidth);
}

import 'package:flutter/material.dart';

class LoginTheme {
  final Color title;
  final Color subTitle;
  final Color already;
  final Color useExisting;
  final Color roundBg;
  final Color roundHighlight;

  LoginTheme(
      {this.title = Colors.black,
      this.subTitle = Colors.black,
      this.already = Colors.black,
      this.useExisting = Colors.red,
      this.roundBg = Colors.grey,
      this.roundHighlight = Colors.black});
}

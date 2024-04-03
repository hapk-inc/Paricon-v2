import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

Logger _logger = Logger();

class BoardNotifier extends ChangeNotifier {
  final bool isOnline;

  BoardNotifier(this.isOnline) {}

  Future initializeBoard() async {
    _logger.d("initializeBoard");
  }
}

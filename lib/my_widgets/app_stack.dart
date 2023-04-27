import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/*
class AppStackPage extends StatelessWidget {
  const AppStackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const EmptyRouterScreen();
}
*/

@RoutePage()
class AppStackPage extends AutoRouter {
  const AppStackPage({super.key});
}

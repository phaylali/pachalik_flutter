import 'package:go_router/go_router.dart';
import 'package:pachalik_flutter/screens/home.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
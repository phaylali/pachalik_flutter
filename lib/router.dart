import 'package:go_router/go_router.dart';
import 'package:pachalik_flutter/screens/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
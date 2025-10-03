import "package:flutter/material.dart";
import "package:pachalik_flutter/router.dart";


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      title: "Pachalik", 
      debugShowCheckedModeBanner: false,   

    );
  }
}
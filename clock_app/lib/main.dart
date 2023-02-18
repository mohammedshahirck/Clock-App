import 'package:clock_app/controller/clock_view/clock_view.dart';
import 'package:clock_app/view/clock_view/clock_view.dart';
import 'package:clock_app/view/homo_page/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ClockViewProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Clock App',
          theme: ThemeData(),
          home: const Homepage()),
    );
  }
}

import 'dart:developer';

import 'package:clock_app/controller/clock_view/clock_view.dart';
import 'package:clock_app/view/clock_view/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 16, 17, 49),
        child: const Center(
          child: ClockView(),
        ),
      ),
    );
  }
}

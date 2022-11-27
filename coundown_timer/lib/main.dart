import 'package:coundown_timer/bloc/timer_bloc.dart';
import 'package:coundown_timer/source/ticker.dart';
import 'package:coundown_timer/views/countdown-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coundown Timer',
      home: BlocProvider(
        create: (context) => TimerBloc(ticker: const Ticker()),
        child: const CountdownPage(),
      ),
    );
  }
}

import 'package:coundown_timer/bloc/timer_bloc.dart';
import 'package:coundown_timer/bloc/timer_state.dart';
import 'package:coundown_timer/widgets/playButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountdownPage extends StatelessWidget {
  const CountdownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 300.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xffCDCDCD),
                            offset: Offset(2, 2),
                            spreadRadius: -5,
                            blurRadius: 10,
                            blurStyle: BlurStyle.outer)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    child: Column(
                      children: [
                        const Text(
                          "Timer",
                          style: TextStyle(
                              letterSpacing: 5,
                              color: Color(0xff595959),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 250,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(80)),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(boxShadow: const [
                                BoxShadow(
                                    color: Color(0xffCDCDCD),
                                    blurRadius: 1,
                                    spreadRadius: 0),
                                BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    blurStyle: BlurStyle.inner)
                              ], borderRadius: BorderRadius.circular(80)),
                              child: BlocBuilder<TimerBloc, TimerState>(
                                  builder: (context, state) {
                                final String hoursSection =
                                    ((state.duration / 3600) % 60)
                                        .floor()
                                        .toString()
                                        .padLeft(2, "0");
                                final String minutesSection =
                                    ((state.duration / 60) % 60)
                                        .floor()
                                        .toString()
                                        .padLeft(2, '0');
                                final String secondsSection =
                                    ((state.duration % 60)
                                        .floor()
                                        .toString()
                                        .padLeft(2, '0'));
                                return GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) => SizedBox(
                                              height: 300,
                                              child: Container(),
                                            ));
                                  },
                                  child: Text(
                                      "$hoursSection:$minutesSection:$secondsSection",
                                      style: const TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold)),
                                );
                              }),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const ActionButtons(),
        ],
      ),
    );
  }
}

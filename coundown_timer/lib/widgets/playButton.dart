import 'package:coundown_timer/bloc/timer_bloc.dart';
import 'package:coundown_timer/bloc/timer_event.dart';
import 'package:coundown_timer/bloc/timer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: ((context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (state is Ready) ...[
              ElevatedButton(
                onPressed: () =>
                    context.read<TimerBloc>().add(Start(state.duration)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color(0xffCDCDCD).withOpacity(0)),
                    elevation: MaterialStateProperty.all(0)),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: -3,
                          blurStyle: BlurStyle.outer)
                    ],
                  ),
                  child: const Text(
                    "Start",
                    style: TextStyle(
                        color: Color(0xff595959),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ] else if (state is Running) ...[
              ElevatedButton(
                onPressed: () => context.read<TimerBloc>().add(const Pause()),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color(0xffCDCDCD).withOpacity(0)),
                    elevation: MaterialStateProperty.all(0)),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: -3,
                          blurStyle: BlurStyle.outer)
                    ],
                  ),
                  child: const Text(
                    "Pause",
                    style: TextStyle(
                        color: Color(0xff595959),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => context.read<TimerBloc>().add(Reset()),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color(0xffCDCDCD).withOpacity(0)),
                    elevation: MaterialStateProperty.all(0)),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: -3,
                          blurStyle: BlurStyle.outer)
                    ],
                  ),
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                        color: Color(0xff595959),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ] else if (state is Paused) ...[
              ElevatedButton(
                onPressed: () =>
                    context.read<TimerBloc>().add(Resume(state.duration)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color(0xffCDCDCD).withOpacity(0)),
                    elevation: MaterialStateProperty.all(0)),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: -3,
                          blurStyle: BlurStyle.outer)
                    ],
                  ),
                  child: const Text(
                    "Resume",
                    style: TextStyle(
                        color: Color(0xff595959),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => context.read<TimerBloc>().add(Reset()),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color(0xffCDCDCD).withOpacity(0)),
                    elevation: MaterialStateProperty.all(0)),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: -3,
                          blurStyle: BlurStyle.outer)
                    ],
                  ),
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                        color: Color(0xff595959),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ] else if (state is Finished) ...[
              ElevatedButton(
                onPressed: () => context.read<TimerBloc>().add(Reset()),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color(0xffCDCDCD).withOpacity(0)),
                    elevation: MaterialStateProperty.all(0)),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: -3,
                          blurStyle: BlurStyle.outer)
                    ],
                  ),
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                        color: Color(0xff595959),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]
          ],
        );
      }),
    );
  }
}

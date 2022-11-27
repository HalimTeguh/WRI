import 'dart:async';

import 'package:coundown_timer/bloc/timer_event.dart';
import 'package:coundown_timer/bloc/timer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../source/ticker.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  //countdown from 60
  static int _duration = 90;
  final Ticker _ticker;

  //to listen to the ticker stream
  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(Ready(_duration)) {
    on<Start>(_onStarted);
    on<Tick>(_onTicked);
    on<Pause>(_onPaused);
    on<Resume>(_onResume);
    on<Reset>(_onReset);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void setDuration(int duration) {
    _duration = duration;
  }

  void _onStarted(Start event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();

    //trigger Running state
    emit(Running(event.duration));

    //subscription listen to Tick state
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(Tick(duration)));
  }

  void _onTicked(Tick event, Emitter<TimerState> emit) {
    emit(event.duration > 0 ? Running(event.duration) : Finished());
  }

  void _onPaused(Pause event, Emitter<TimerState> emit) {
    //pause the subscription
    _tickerSubscription?.pause();
    emit(Paused(state.duration));
  }

  void _onResume(Resume event, Emitter<TimerState> emit) {
    _tickerSubscription?.resume();
    emit(Running(state.duration));
  }

  void _onReset(Reset event, Emitter<TimerState> emit) {
    //cancel subscription, when Timer counting is finished
    _tickerSubscription?.cancel();
    emit(Ready(_duration));
  }
}

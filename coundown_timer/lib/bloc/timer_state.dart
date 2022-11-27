import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  int duration;

  TimerState(this.duration);

  @override
  // TODO: implement props
  List<Object> get props => [duration];
}

class Ready extends TimerState {
  Ready(duration) : super(duration);
}

class Paused extends TimerState {
  Paused(int duration) : super(duration);
}

class Running extends TimerState {
  Running(int duration) : super(duration);
}

class Finished extends TimerState {
  Finished() : super(0);
}

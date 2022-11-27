import 'package:equatable/equatable.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Start extends TimerEvent {
  final int duration;
  const Start(this.duration);
}

class Pause extends TimerEvent {
  const Pause();
}

class Resume extends TimerEvent {
  final int duration;
  const Resume(this.duration);
}

class Reset extends TimerEvent {}

class Tick extends TimerEvent {
  final int duration;
  const Tick(this.duration);

  @override
  List<Object> get props => [duration];
}

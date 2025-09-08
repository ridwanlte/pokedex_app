part of 'bottomnavbar_bloc.dart';

abstract class BottomnavbarEvent extends Equatable {
  const BottomnavbarEvent();

  @override
  List<Object> get props => [];
}

class BottomNavbarTap extends BottomnavbarEvent {
  final int index;
  BottomNavbarTap(this.index);
}

part of 'bottomnavbar_bloc.dart';

abstract class BottomnavbarState extends Equatable {
  const BottomnavbarState();

  @override
  List<Object> get props => [];
}

final class BottomnavbarInitial extends BottomnavbarState {
  final int index;
  BottomnavbarInitial(this.index);
}

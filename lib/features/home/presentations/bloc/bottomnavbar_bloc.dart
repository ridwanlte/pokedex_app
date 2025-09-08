import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottomnavbar_event.dart';
part 'bottomnavbar_state.dart';

class BottomnavbarBloc extends Bloc<BottomnavbarEvent, BottomnavbarState> {
  BottomnavbarBloc() : super(BottomnavbarInitial(0)) {
    on<BottomNavbarTap>((event, emit) {
      // TODO: implement event handler
      emit(BottomnavbarInitial(event.index));
    });
  }
}

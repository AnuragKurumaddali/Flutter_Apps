import 'package:flutter_bloc/flutter_bloc.dart';

sealed class EventCounter {}

final class DecrementCounter extends EventCounter {}

final class IncrementCounter extends EventCounter {}

class CounterBloc extends Bloc<EventCounter, int> {
  CounterBloc() : super(0) {
    on<EventCounter>(
      (event, emit) {
        switch (event) {
          case DecrementCounter():
            if (state == 0) {
              return;
            }
            emit(state - 1);
          case IncrementCounter():
            emit(state + 1);
        }
      },
    );
  }
}

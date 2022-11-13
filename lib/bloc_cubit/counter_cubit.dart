import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterA());

  int teamAPoints = 2;
  int teamBPoints = 0;

  void team_increment ({required String team , required int button_number}){
    if (team == 'A'){
      teamAPoints+=button_number;
      emit(CounterA());}
    else if  (team == 'B'){
      teamBPoints+=button_number;
      emit(CounterB());}
  }
}

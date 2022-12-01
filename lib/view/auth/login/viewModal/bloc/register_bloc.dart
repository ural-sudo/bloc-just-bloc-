import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<RegisterEvent>((event, emit)  {
      mapToEvents(event,emit);
    });
  }

  void mapToEvents(RegisterEvent event, Emitter<RegisterState> emit){
    
    if(event is EnterPassword){
      final result = event.value?.toDouble();
      emit(state.copyWith(passWordLenght: result,isEnteredSomething: event.check));
    }
  }


}

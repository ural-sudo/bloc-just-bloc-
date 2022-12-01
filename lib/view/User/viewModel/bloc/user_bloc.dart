import 'package:bloc/bloc.dart';
import 'package:bloc_without_cubit/view/User/service/user_service.dart';
import 'package:dio/dio.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../model/user.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  final IUserService service = UserService(Dio());

  UserBloc() : super(const UserState()){
    on<UserEvent>((event, emit) async {
      await maptoEvents(event,emit);
    });
  }
  Future<void> maptoEvents(UserEvent? event, Emitter<UserState> emit) async {
    if(event is GetUsers){
      emit(state.copyWith(isLoading: true));
      final user = await  service.getUsers();
      emit(state.copyWith(isLoading: false,user: user));
    }
  }
}

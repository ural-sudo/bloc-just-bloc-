part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {
  const RegisterEvent();
}


class EnterPassword extends RegisterEvent{
  EnterPassword(this.value,this.check);

  int? value;
  bool? check;
}




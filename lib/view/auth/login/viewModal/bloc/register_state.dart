part of 'register_bloc.dart';

@immutable
class RegisterState extends Equatable {

  RegisterState({this.passWordLenght = 0, this.isEnteredSomething =false});
  double? passWordLenght;
  bool? isEnteredSomething;

  @override
  List<Object?> get props => [passWordLenght,isEnteredSomething];


  RegisterState copyWith ({
    double? passWordLenght,
    bool? isEnteredSomething,
  }){
    return RegisterState(
      passWordLenght: passWordLenght ?? this.passWordLenght,
      isEnteredSomething: isEnteredSomething ?? this.isEnteredSomething,
    );
  }
  
}

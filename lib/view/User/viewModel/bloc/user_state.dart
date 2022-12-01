part of 'user_bloc.dart';

@immutable
class UserState extends Equatable{
  // UserState Constructer for initial values
  // Presentation da stateleri yönetmek istediğimiz değerleri tanımlıyoruz ve inital değerlerinin ne olacağını belirtiyoruz.
  const UserState({this.isLoading = false,this.user });
  final User? user; // Gelen userları sayfaya göndereceğiz.
  final bool isLoading; // Userlar gelene kadar geçen sürede loading barı yöneteceğiz.

  @override
  List<Object?> get props => [user,isLoading];

  UserState copyWith({
    User? user,
    bool? isLoading,
  }) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}


part of 'user_bloc.dart';


// This class defines the actions  related to this bloc.
// For example if you want to get the some users from api. You can define the actions relation with this.

@immutable
abstract class UserEvent  {
  const UserEvent();
}

class GetUsers extends UserEvent{
  const GetUsers();
}

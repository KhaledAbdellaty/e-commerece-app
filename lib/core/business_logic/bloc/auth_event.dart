part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {}

class LoginWithGoogle extends AuthEvent {
  final Users user;
  LoginWithGoogle({required this.user});

  @override
  List<Object?> get props => [user];
}

class LoginWithEmailAndPassword extends AuthEvent {
  final Users user;
  LoginWithEmailAndPassword({required this.user});
  @override
  List<Object?> get props => [user];
}

class CreateNewUser extends AuthEvent {
  final Users user;
  CreateNewUser({required this.user});
  @override
  List<Object?> get props => [user];
}

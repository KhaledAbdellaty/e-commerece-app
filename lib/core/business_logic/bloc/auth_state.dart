part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoginedWithGoogle extends AuthState {
  final Users user;
  AuthLoginedWithGoogle({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthLoginedWithEmailAndPassword extends AuthState {
  final Users user;
  AuthLoginedWithEmailAndPassword({required this.user});

  @override
  List<Object?> get props => [user];
}

class CreatedNewUser extends AuthState {
  final Users user;
  CreatedNewUser({required this.user});
  @override
  List<Object?> get props => [user];
}

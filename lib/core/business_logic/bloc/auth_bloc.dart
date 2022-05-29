import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:new_e_commerece_app/features/auth/data/repositories/auth_repo_imp.dart';

import '../../data/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepoImpl authRepoImpl;
  AuthBloc({required this.authRepoImpl}) : super(AuthLoading()) {
    on<LoginWithGoogle>((event, emit) async {
      emit(AuthLoading());
      await authRepoImpl.loginWithGoogle().then(
            (value) => emit(
              AuthLoginedWithGoogle(
                user: Users(
                  name: value.user!.displayName,
                  phoneNo: value.user!.phoneNumber,
                  photoUrl: value.user!.photoURL,
                  id: value.user!.uid,
                ),
              ),
            ),
          );
    });

    on<LoginWithEmailAndPassword>(((event, emit) async {
      try {
        await authRepoImpl
            .signInUser(
                event.user.email.toString(), event.user.email.toString())
            .then((value) {
          emit(AuthLoginedWithEmailAndPassword(
              user: Users(
                  name: value.user!.displayName, email: value.user!.email)));
        });
      } on PlatformException catch (e) {
        throw Exception('error : $e');
      }
    }));

    on<CreateNewUser>((event, emit) async {
      emit(AuthLoading());
      await authRepoImpl
          .createNewUser(
              event.user.email.toString(), event.user.password.toString())
          .then((value) => emit(CreatedNewUser(user: event.user)));
    });
  }
}

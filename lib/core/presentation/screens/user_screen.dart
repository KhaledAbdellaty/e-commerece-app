import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/bloc/auth_bloc.dart';
import '../../data/models/user.dart';

class UserScreen extends StatefulWidget {
  final Users user;
  const UserScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).emit(CreatedNewUser(user: widget.user));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is CreatedNewUser) {
            return Column(
              children: [
                Text(state.user.name.toString()),
                Text(state.user.phoneNo.toString()),
                Text(state.user.email.toString()),
              ],
            );
          } else if (state is AuthLoginedWithEmailAndPassword) {
            return Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    child: Text('Sign out'))
              ],
            );
          }
          return Center(child: Text('No Data'));
        },
      ),
    );
  }
}

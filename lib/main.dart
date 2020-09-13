import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koap_app/core/bloc/user_login_bloc/user_login_event.dart';
import 'package:koap_app/core/bloc/user_login_bloc/user_login_state.dart';
import 'package:koap_app/view/main_view/home_view.dart';
import 'package:koap_app/view/registretion_view/registration.dart';
import 'data/repositories/user_repositories.dart';
import 'core/bloc/user_auth_bloc/user_auth_bloc.dart';
import 'core/bloc/user_auth_bloc/user_auth_event.dart';
import 'core/bloc/user_auth_bloc/user_auth_state.dart';

import 'view/login/login_page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kopa Companies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color.fromRGBO(31, 31, 31, 1),
      ),
      home: BlocProvider<AuthBloc>(
        create: (context) =>
            AuthBloc(userRepository: UserRepositories())..add(AppStartEvent()),
        child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
          print(state);
          if (state is AuthInitialState) {
            return LoginPage();
          } else if (state is AuthSuccess) {
            return RegUser();
          } else if (state is NoAuth) {
            return LoginPage();
          } else if (state is AuthLoading)
            return Container(
              child: CircularProgressIndicator(),
            );
          return Container();
        }),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:koap_app/core/bloc/user_auth_bloc/user_auth_bloc.dart';
import 'package:koap_app/core/bloc/user_login_bloc/user_login_bloc.dart';
import 'package:koap_app/core/bloc/user_login_bloc/user_login_event.dart';
import 'package:koap_app/core/bloc/user_login_bloc/user_login_state.dart';
import 'package:koap_app/data/repositories/user_repositories.dart';
import 'package:koap_app/view/login/otp_verify_view.dart';
import 'package:koap_app/view/login/verify_phone_view.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:koap_app/view/registretion_view/registration.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final bool onPhone = false;
//  final LoginBloc = LoginBloc();

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 31, 31, 1),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child:  BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(UserRepositories(), AuthBloc()),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state){
                print(state);
                if(state is LoginInitialState)
                  return buildLoginPage(context);
                else if(state is SendOTPState)
                  return SendOtpScreen(context);
                else if(state is VerifyOTPState)
                  return Phone();
                else if(state is LoginLoading)
                  return Center(child: CircularProgressIndicator());
                else if(state is LoginFaild)
                  return Text("Error");
                else if(state is LoginSuccess){
                  return RegUser();
                }
              },
            ),
          )

//          buildLoginPage(),
        ),
      ),
    );
  }

  Widget buildLoginPage(context) {
    final LogBloc = BlocProvider.of<LoginBloc>(context);
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.6,
          alignment: Alignment.bottomCenter,
          child: Image.asset('assets/Shape18.png'),
        ),
        Container(
          height: size.height * 0.2,
          child: Stack(alignment: Alignment.center, children: <Widget>[
            Container(child: Image.asset('assets/Ellipse.png')),
            Container(
                child: Text("Вхід",
                    style: TextStyle(color: Colors.white, fontSize: 28))),
          ]),
        ),
        Container(
          height: size.height * 0.2,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                onPressed: () {
                  LogBloc..add(SignInWithPhone());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff5BA32F).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xff42FF00),
                    child: Icon(
                      Icons.local_phone,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: ()  {
                  LogBloc..add(SignInWithFacebook());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xff44429B),
                    child: Image.asset('assets/facebook.png'),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  LogBloc..add(SignInWithGoogle());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xffFF0000),
                    child: Image.asset('assets/Group26.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget builderLoading() {
    return Container(
      child: CircularProgressIndicator(),
    );
  }


}

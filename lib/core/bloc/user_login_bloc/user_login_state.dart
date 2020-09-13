
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:koap_app/domain/model/user_model.dart';


abstract class LoginState extends Equatable{

}

class LoginInitialState extends LoginState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class LoginLoading extends LoginState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class SendOTPState extends LoginState{

}

class VerifyOTPState extends LoginState{

}

class LoginSuccess extends LoginState{

}

class LoginFaild extends LoginState{
  String error;

  LoginFaild({this.error});
  @override
  // TODO: implement props
  List<Object> get props => [error];

}
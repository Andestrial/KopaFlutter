import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:koap_app/domain/model/user_model.dart';

abstract class RegisterUserState extends Equatable{

}

class RegisterInitialState extends RegisterUserState{

}

class RegisterSuccessState extends RegisterUserState {

  User user;

  RegisterSuccessState(this.user);

}

class RegisterExceptionState extends RegisterUserState {

  String error;

  RegisterExceptionState({this.error});
}

class RegisterLoading extends RegisterUserState{

}


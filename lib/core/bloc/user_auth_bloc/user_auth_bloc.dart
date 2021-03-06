import 'dart:async';
import 'package:koap_app/core/bloc/user_auth_bloc/user_auth_event.dart';
import 'package:koap_app/core/bloc/user_auth_bloc/user_auth_state.dart';
import 'package:koap_app/data/repositories/user_repositories.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


class AuthBloc extends Bloc<AuthEvents, AuthState>{

  final UserRepositories  userRepository;

  AuthBloc({@required this.userRepository}) : super(AuthInitialState());


  AuthState get initialState => AuthInitialState();

  @override
  Stream<AuthState> mapEventToState( AuthEvents event) async*{
   try{
     if(event is AppStartEvent)  {
       yield AuthLoading();
         final user = await userRepository.getCurrentUser();
         print(user);
         if(user !=null){
         yield AuthSuccess(user: user);
       }else{
         yield NoAuth();
       }

     }
     if(event is UserLoggedIn){
        yield AuthSuccess(user: event.user);
     }

   }  catch (e) {
     print(e.toString());
     yield AuthFailed(error :e.toString());
   }
  }

}
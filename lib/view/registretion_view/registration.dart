import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koap_app/core/bloc/user_login_bloc/user_login_event.dart';
import 'package:koap_app/core/bloc/user_register_bloc/user_register_bloc.dart';
import 'package:koap_app/core/bloc/user_register_bloc/user_register_event.dart';
import 'package:koap_app/core/bloc/user_register_bloc/user_register_state.dart';
import 'package:koap_app/resources/colors_resources.dart';
import 'package:koap_app/resources/main_colors_resources.dart';
import 'package:koap_app/soursec/database.dart';
import 'package:koap_app/view/login/login_page_view.dart';
import 'package:koap_app/view/main_view/home_view.dart';


class RegUser extends StatefulWidget {
  @override
  _RegUserState createState() => _RegUserState();
}

class _RegUserState extends State<RegUser> {
  @override

  final name  = TextEditingController();
  final surname = TextEditingController();
  final city = TextEditingController();

  bool _validateName = false;
  bool _validateSurname = false;
  bool _validateCity = false;

  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return  BlocProvider<RegisterUserBloc>(
      create: (context) => RegisterUserBloc(Database())..add(RegisterInitialEvent()),
      child: BlocBuilder<RegisterUserBloc , RegisterUserState>(
        builder: (context, state){
          print(state);
          if(state is RegisterInitialState){
            return buildRegPage(context);
          }
          else if(state is RegisterSuccessState){
            return Home(state.user);
          }
          else if(state is RegisterExceptionState){
            return Container(child: Text("ЕДРЫТЬ, ПАМЫЛКА СУК"),);
          }
          else if(state is RegisterLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },

      ),
    );
  }

  Widget buildRegPage(context){
    final size = MediaQuery.of(context).size;
    return   Scaffold(
        backgroundColor: ApplicationColors().darkBg,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              color: ApplicationColors().darkBg,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 114,
                    child: Stack(alignment: Alignment.center, children: <Widget>[
                      Container(child: Image.asset('assets/Ellipse.png')),
                      Container(
                          child: Text("Вхід", style: TextStyle(color: Colors.white, fontSize: 28))),
                    ]),
                  ),
                  SizedBox(height: 40,),
                  Form(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 90,
                          child: TextFormField(
                            controller: name,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                            decoration: InputDecoration(
                              errorText: _validateName ? 'Поле не повинне бути порожнім' : null,
                              hintStyle: TextStyle(color: GrayColText),
                              hintText: "Ім'я",
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: GrayColText),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: cyan),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: errColMain),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: cyan),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 22,),
                        Container(
                          width: MediaQuery.of(context).size.width - 90,
                          child: TextFormField(
                            controller: surname,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                            decoration: InputDecoration(
                              errorText: _validateSurname ? 'Поле не повинне бути порожнім' : null,
                              hintStyle: TextStyle(color: GrayColText),
                              hintText: 'Прізвище',
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: GrayColText),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: cyan),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: errColMain),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: cyan),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 22,),
                        Container(
                          width: MediaQuery.of(context).size.width - 90,
                          child: TextFormField(
                            controller: city,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                            decoration: InputDecoration(
                              errorText: _validateCity ? 'Поле не повинне бути порожнім' : null,
                              hintText: 'Місто',
                              hintStyle: TextStyle(color: GrayColText),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: GrayColText),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: cyan),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: errColMain),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: cyan),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height - 580),
                  Container(
                    width: MediaQuery.of(context).size.width - 90,
                    height: 46,
                    child: RaisedButton(
                      color: ApplicationColors().lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),

                      onPressed: () {
                        String pattern = r'^[a-zа-яёіїA-ZА-ЯЁІЇ\s^-]+$';
                        RegExp regex = RegExp(pattern);
                        setState(() {
                          name.text.isEmpty || !regex.hasMatch(name.text) ? _validateName = true : _validateName = false;
                          surname.text.isEmpty || !regex.hasMatch(surname.text) ? _validateSurname = true : _validateSurname = false;
                          city.text.isEmpty || !regex.hasMatch(city.text) ? _validateCity = true : _validateCity = false;
                        });
                        if (_validateName == false && _validateSurname == false && _validateCity == false) {
                          final RegBloc = BlocProvider.of<RegisterUserBloc>(context);
                          RegBloc..add(RegisterCreateUser(name.text, surname.text, city.text ));
                        }
                      },
                      child: Text('Готово', style: TextStyle(color: Colors.white),),
                    ),
                  ),

                ],

              ),
            ),
          ),
        ));
  }
}


//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:koap_app/core/bloc/user_login_bloc/user_login_event.dart';
//import 'package:koap_app/core/bloc/user_register_bloc/user_register_bloc.dart';
//import 'package:koap_app/core/bloc/user_register_bloc/user_register_event.dart';
//import 'package:koap_app/core/bloc/user_register_bloc/user_register_state.dart';
//import 'package:koap_app/resources/colors_resources.dart';
//import 'package:koap_app/soursec/database.dart';
//import 'package:koap_app/view/login/login_page_view.dart';
//import 'package:koap_app/view/main_view/home_view.dart';
//
//class RegUser extends StatefulWidget {
//  @override
//  _RegUserState createState() => _RegUserState();
//}
//
//class _RegUserState extends State<RegUser> {
//  @override
//  final name  = TextEditingController();
//
//  final surname = TextEditingController();
//
//  final city = TextEditingController();
//
//  Widget build(BuildContext context) {
//
//    final size = MediaQuery.of(context).size;
//
//    return  BlocProvider<RegisterUserBloc>(
//        create: (context) => RegisterUserBloc(Database())..add(RegisterInitialEvent()),
//        child: BlocBuilder<RegisterUserBloc , RegisterUserState>(
//          builder: (context, state){
//            print(state);
//            if(state is RegisterInitialState){
//              return buildRegPage(context);
//            }
//            else if(state is RegisterSuccessState){
//              return Home(state.user);
//            }
//            else if(state is RegisterExceptionState){
//              return Container(child: Text("ЕДРЫТЬ, ПАМЫЛКА СУК"),);
//            }
//            else if(state is RegisterLoading){
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            }
//          },
//
//        ),
//      );
//  }
//
//  Widget buildRegPage(context){
//    final size = MediaQuery.of(context).size;
//   return   Scaffold(
//       backgroundColor: ApplicationColors().darkBg,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Container(
//               color: ApplicationColors().darkBg,
//               width: size.width,
//           child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: [
//                        Container(
//                          height: 114,
//                          child: Stack(alignment: Alignment.center, children: <Widget>[
//                            Container(child: Image.asset('assets/Ellipse.png')),
//                            Container(
//                                child: Text("Вхід",
//                                    style: TextStyle(color: Colors.white, fontSize: 28))),
//                          ]),
//                        ),
//                        SizedBox(height: 40,),
//                        Form(
//                          child: Column(
//                            children: [
//                              Container(
//                                width: 283,
//                                height: 34,
//                                child: TextFormField(
//
//                                  controller: name,
//                                  style: TextStyle(fontSize: 15, color: Colors.white),
////                                      initialValue: '+380',
//                                  decoration: InputDecoration(
//                                    hintStyle: TextStyle(color: Colors.white),
//                                    hintText: "Ім'я",
//                                    contentPadding:
//                                    EdgeInsets.symmetric(horizontal: 10.0,
//                                        vertical: 5.0),
//                                    fillColor: Colors.white,
//                                    focusedBorder: OutlineInputBorder(
//                                      borderRadius: BorderRadius.circular(25.0),
//                                      borderSide: BorderSide(
//                                        color: Colors.blue,
//                                      ),
//                                    ),
//                                    enabledBorder: OutlineInputBorder(
//                                      borderRadius: BorderRadius.circular(25.0),
//                                      borderSide: BorderSide(
//                                        color: Colors.white.withOpacity(0.38),
//                                        width: 2.0,
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ),
//                              SizedBox(height: 22,),
//                              Container(
//                                width: 283,
//                                height: 34,
//                                child: TextFormField(
//                                  controller: surname,
//                                  style: TextStyle(fontSize: 15, color: Colors.white),
////                                      initialValue: '+380',
//                                  decoration: InputDecoration(
//                                    hintStyle: TextStyle(color: Colors.white),
//                                    hintText: 'Прізвище',
//                                    contentPadding:
//                                    EdgeInsets.symmetric(horizontal: 10.0,
//                                        vertical: 5.0),
//                                    fillColor: Colors.white,
//                                    focusedBorder: OutlineInputBorder(
//                                      borderRadius: BorderRadius.circular(25.0),
//                                      borderSide: BorderSide(
//                                        color: Colors.blue,
//                                      ),
//                                    ),
//                                    enabledBorder: OutlineInputBorder(
//                                      borderRadius: BorderRadius.circular(25.0),
//                                      borderSide: BorderSide(
//                                        color: Colors.white.withOpacity(0.38),
//                                        width: 2.0,
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ),
//                              SizedBox(height: 22,),
//                              Container(
//                                width: 283,
//                                height: 34,
//                                child: TextFormField(
//                                  controller: city,
//                                  style: TextStyle(fontSize: 15, color: Colors.white),
////                                      initialValue: '+380',
//                                  decoration: InputDecoration(
//                                    hintText: 'Місто',
//                                    hintStyle: TextStyle(color: Colors.white),
//                                    contentPadding:
//                                    EdgeInsets.symmetric(horizontal: 10.0,
//                                        vertical: 5.0),
//                                    fillColor: Colors.white,
//                                    focusedBorder: OutlineInputBorder(
//                                      borderRadius: BorderRadius.circular(25.0),
//                                      borderSide: BorderSide(
//                                        color: Colors.blue,
//                                      ),
//                                    ),
//                                    enabledBorder: OutlineInputBorder(
//                                      borderRadius: BorderRadius.circular(25.0),
//                                      borderSide: BorderSide(
//                                        color: Colors.white.withOpacity(0.38),
//                                        width: 2.0,
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 380,),
//                               Container(
//                                width: 283,
//                                height: 34,
//                                child: RaisedButton(
//                                  color: ApplicationColors().lightBlue,
//                                  shape: RoundedRectangleBorder(
//                                    borderRadius: new BorderRadius.circular(30.0),
//                                  ),
//
//                                  onPressed: () {
//                                    final RegBloc = BlocProvider.of<RegisterUserBloc>(context);
//                                    RegBloc..add(RegisterCreateUser(name.text, surname.text, city.text ));
//                                  },
//                                  child: Text('Готово', style: TextStyle(color: Colors.white),),
//                                ),
//                              ),
//
//                      ],
//
//            ),
//     ),
//         ),
//       ));
//  }
//}

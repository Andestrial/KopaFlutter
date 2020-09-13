//
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:koap_app/core/bloc/user_auth_bloc/user_auth_bloc.dart';
//import 'package:koap_app/core/bloc/user_login_bloc/user_login_bloc.dart';
//import 'package:koap_app/core/bloc/user_login_bloc/user_login_event.dart';
//import 'package:koap_app/core/bloc/user_login_bloc/user_login_state.dart';
//import 'package:koap_app/data/repositories/user_repositories.dart';
//import 'package:koap_app/resources/colors_resources.dart';
//import 'package:koap_app/view/login/otp_verify_view.dart';
//import 'package:koap_app/view/registretion_view/registration.dart';
//
//
//
//class SendOtpScreen extends StatefulWidget {
//  BuildContext context;
//
//  SendOtpScreen(this.context);
//  @override
//  _SendOtpScreenState createState() => _SendOtpScreenState();
//}
//
//class _SendOtpScreenState extends State<SendOtpScreen> {
//  @override
//  final _phoneController = TextEditingController(text: '+380');
//
//
//  Widget build(context) {
//    final size = MediaQuery.of(context).size;
//
//    return Scaffold(
//        backgroundColor: Color.fromRGBO(31, 31, 31, 1),
//        body: SingleChildScrollView(
//                child: Container(
//                  width: size.width,
//                  height: size.height,
//                  child: buildVerifyPhoneScreen(context)
//
//
//
//                ),
//              ),
//            );
//  }
//  Widget buildVerifyPhoneScreen (context) {
//    final size = MediaQuery.of(context).size;
//    return     Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      mainAxisSize: MainAxisSize.min,
//      children: [
//        Container(
//          child: Image.asset('assets/Shape18.png'),
//        ),
//        Stack(alignment: Alignment.center, children: <Widget>[
//          Container(child: Image.asset('assets/Ellipse.png')),
//          Container(
//              child: Text("Вхід",
//                  style: TextStyle(color: Colors.white, fontSize: 28))),
//        ]),
//        Form(
//          child: Column(
//            children: [
//              SizedBox(
//                height: 20,
//              ),
//              Container(
//                width: 283,
//                height: 34,
//                child: TextFormField(
//                  keyboardType: TextInputType.phone,
//                  controller: _phoneController,
//                  style: TextStyle(fontSize: 15, color: Colors.white),
////                                      initialValue: '+380',
//                  decoration: InputDecoration(
//                    hintStyle: TextStyle(color: Colors.grey),
//                    contentPadding: EdgeInsets.symmetric(
//                        horizontal: 10.0, vertical: 5.0),
//                    fillColor: Colors.white,
//                    focusedBorder: OutlineInputBorder(
//                      borderRadius: BorderRadius.circular(25.0),
//                      borderSide: BorderSide(
//                        color: Colors.blue,
//                      ),
//                    ),
//                    enabledBorder: OutlineInputBorder(
//                      borderRadius: BorderRadius.circular(25.0),
//                      borderSide: BorderSide(
//                        color: Colors.white.withOpacity(0.38),
//                        width: 2.0,
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//              SizedBox(
//                height: 40,
//              ),
//              Container(
//                width: 283,
//                height: 34,
//                child: FlatButton(
//                  color: ApplicationColors().lightBlue,
//                  shape: RoundedRectangleBorder(
//                    borderRadius: new BorderRadius.circular(30.0),
//                  ),
//                  onPressed: () async {
//                    final Login = BlocProvider.of<LoginBloc>(context);
//                    final phone = _phoneController.text.trim();
//                    Login..add(SendOTPCodeEvent(phone, context));
//                  },
//                  child: Text('Верефікувати', style: TextStyle(color: Colors.white),),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ],
//    );
//  }
//}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koap_app/core/bloc/user_auth_bloc/user_auth_bloc.dart';
import 'package:koap_app/core/bloc/user_login_bloc/user_login_bloc.dart';
import 'package:koap_app/core/bloc/user_login_bloc/user_login_event.dart';
import 'package:koap_app/core/bloc/user_login_bloc/user_login_state.dart';
import 'package:koap_app/data/repositories/user_repositories.dart';
import 'package:koap_app/resources/colors_resources.dart';
import 'package:koap_app/resources/main_colors_resources.dart';
import 'package:koap_app/view/login/otp_verify_view.dart';
import 'package:koap_app/view/registretion_view/registration.dart';
//import 'package:toast/toast.dart';

class SendOtpScreen extends StatefulWidget {
  BuildContext context;

  SendOtpScreen(this.context);

  @override
  _SendOtpScreenState createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  final _phoneController = TextEditingController(text: '+380');
  bool _validateNumber = false;
  bool _validateNumberSign = false;

  @override
  Widget build(context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 31, 31, 1),
      body: SingleChildScrollView(
        child: Container(
            width: size.width,
            height: size.height,
            child: buildVerifyPhoneScreen(context)),
      ),
    );
  }

  Widget buildVerifyPhoneScreen(context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Image.asset('assets/Shape18.png'),
        ),
        Stack(alignment: Alignment.center, children: <Widget>[
          Container(child: Image.asset('assets/Ellipse.png')),
          Container(
              child: Text("Вхід",
                  style: TextStyle(color: Colors.white, fontSize: 28))),
        ]),
        Form(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 90,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  maxLength: 13,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  decoration: InputDecoration(
                    counter: Offstage(),
                    hintStyle: TextStyle(color: Colors.grey),
                    errorText: _validateNumber ? 'Поле порожнє' : _validateNumberSign ? 'Перевріте номер' : null,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
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
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 90,
                height: 46,
                child: FlatButton(
                  color: ApplicationColors().lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: () async {
                    setState(() {
                      String pattern = r'^((\+?380)([0-9]{9}))$';
                      RegExp regex = new RegExp(pattern);
                      _phoneController.text.isEmpty ? _validateNumber = true : _validateNumber = false;
                      if (_validateNumber == false) {
                        !regex.hasMatch(_phoneController.text) ? _validateNumberSign = true : _validateNumberSign = false;
                      }
                    });
                    if (_validateNumber == false && _validateNumberSign == false) {
                    final Login = BlocProvider.of<LoginBloc>(context);
                    final phone = _phoneController.text.trim();
                    Login..add(SendOTPCodeEvent(phone, context));
                    }

                  },
                  child: Text(
                    'Верефікувати',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koap_app/core/bloc/user_login_bloc/user_login_bloc.dart';
import 'package:koap_app/core/bloc/user_login_bloc/user_login_event.dart';
import 'package:koap_app/resources/colors_resources.dart';
import 'package:koap_app/resources/main_colors_resources.dart';
//import 'package:toast/toast.dart';

class Phone extends StatefulWidget {
  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  final codeControler = TextEditingController();
  bool _validateCode = false;

  @override
  Widget build(BuildContext context) {
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
                  keyboardType: TextInputType.number,
                  controller: codeControler,
                  obscureText: true,
                  maxLength: 6,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  decoration: InputDecoration(
                    counter: Offstage(),
                    hintStyle: TextStyle(color: Colors.grey),
                    errorText: _validateCode ? 'Поле порожнє' : null,
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
                                  codeControler.text.isEmpty ? _validateCode = true : _validateCode = false;
                                });
                    if (_validateCode == false) {
                    final Login = BlocProvider.of<LoginBloc>(context);
                    final otp = codeControler.text;
                    Login
                      ..add(VerifyOTPEvent(
                        otp,
                      ));
                    }
                    /*else {
                                  Toast.show(
                                    'Помилка! Перевірте Ваші дані.',
                                    context,
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.CENTER,
                                    textColor: whiteColMain,
                                    backgroundColor: errColBg,
                                    backgroundRadius: 20.0,
                                  );
                                }*/
                  },
                  child: Text(
                    'Далі',
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

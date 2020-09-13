import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koap_app/resources/icon_resources.dart';
import 'package:koap_app/resources/main_colors_resources.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child:  Text("У вас немає улюблених...", style: TextStyle(color: whiteColMain)),);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koap_app/data/repositories/user_repositories.dart';
import 'package:koap_app/domain/model/user_model.dart';
import 'package:koap_app/resources/main_colors_resources.dart';


class Profile extends StatelessWidget {

  @override

  User user ;

  Profile({this.user});

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.0, right: 30.0, left: 30.0),
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: GestureDetector(
                        child: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 45.5,
                              backgroundColor: gray,
                              backgroundImage: AssetImage('assets/avatar.png'),
                            ),
                            Positioned(
                              top: 59,
                              left: 53,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: cyan,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconButton(
                                  splashColor: Color(0x00FFFFFF),
                                  highlightColor: Color(0x00FFFFFF),
                                  padding: const EdgeInsets.all(0),
                                  icon: Icon(
                                    Icons.add,
                                    color: whiteColMain,
                                    size: 26,
                                  ),
                                  tooltip: 'Змінити аватаку',
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 170,
                          child: Text(
                            '${user.name} ${user.surname}',
                            style: TextStyle(fontSize: 22, color: whiteColMain, fontWeight: FontWeight.bold),
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Контактний номер', style: TextStyle(color: Colors.white),),
                    Text('${user.phoneNumber}', style: TextStyle(fontSize: 18, color: Colors.white),),
                    Divider(height: 0.5, color: Colors.white,),
                  ],
                ),

              ),
              SizedBox(height: 30),
              Container(
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Місто', style: TextStyle(color: Colors.white),),
                    Text('${user.city}', style: TextStyle(fontSize: 18, color: Colors.white),),
                    Divider(height: 0.5, color: Colors.white,),
                  ],
                ),
              ),
              SizedBox(height: 30),



              ButtonTheme(
                minWidth: 283,
                height: 34,
                child: RaisedButton(
                  color: Color(0xff0CCDE6),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    SystemNavigator.pop();
                    UserRepositories().SignOut();
                  },
                  child: Text("Вийти", style: TextStyle(color: Colors.white),),
                ),
              ),







            ]),
          ),

        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koap_app/data/repositories/user_repositories.dart';
import 'package:koap_app/domain/model/user_model.dart';
import 'package:koap_app/view/main_screens/create_new_kopa_view.dart';
import 'package:koap_app/view/main_screens/profile_view.dart';
import 'dart:math' as math;
import '../main_screens/active_archive_view.dart';
import '../main_screens/favorites_view.dart';
import '../main_screens/home_screen_view.dart';


class Home extends StatefulWidget {
  @override
  User user;

  Home(this.user);

  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  FirebaseUser userForArchive;
  @override
  Widget build(BuildContext context) {

    List<Widget> Screens = [
      HomeScreen(),
      ActiveAndArchive(userForArchive),
      Favorites(),
      Profile(user: widget.user),
    ];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 31, 31, 1),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg_screen.png'), fit: BoxFit.fill)),
        child: Screens[currentIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Color(0xff505051),
        child: Container(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 65,
                padding: currentIndex == 0 ? const EdgeInsets.only(top: 0.0) : const EdgeInsets.only(top: 4.0),
                decoration: currentIndex == 0
                    ? BoxDecoration(
//                  color: Colors.red,
                    border: Border(
                        top:
                        BorderSide(width: 4, color: Color(0xff0CCDE6))))
                    : null,
                child: IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/icons/HealthData.png'),
                    size: 25,
                    color: currentIndex == 0 ? Color(0xff0CCDE6) : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                ),
              ),
              Container(
                height: 65,
                padding: currentIndex == 1 ? const EdgeInsets.only(top: 0.0) : const EdgeInsets.only(top: 4.0),
                decoration: currentIndex == 1
                    ? BoxDecoration(
//                  color: Colors.red,
                    border: Border(
                        top:
                        BorderSide(width: 4, color: Color(0xff0CCDE6))))
                    : null,
                child: IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/icons/Vector.png'),
                    size: 50,
                    color: currentIndex == 1 ? Color(0xff0CCDE6) : Colors.grey,
                  ),
                  onPressed: () async{
                    final userToArchive = await UserRepositories().getCurrentUser();
                    setState(() {
                      userForArchive = userToArchive;
                      currentIndex = 1;
                    });
                  },
                ),
              ),
              SizedBox.shrink(),
              Container(
                height: size.height,
                padding: currentIndex == 2 ? const EdgeInsets.only(top: 0.0) : const EdgeInsets.only(top: 4.0),
                decoration: currentIndex == 2
                    ? BoxDecoration(
//                  color: Colors.red,
                    border: Border(
                        top:
                        BorderSide(width: 4, color: Color(0xff0CCDE6))))
                    : null,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: currentIndex == 2 ? Color(0xff0CCDE6) : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                ),
              ),
              Container(
                height: size.height,
                padding: currentIndex == 3 ? const EdgeInsets.only(top: 0.0) : const EdgeInsets.only(top: 4.0),
                decoration: currentIndex == 3
                    ? BoxDecoration(
//                  color: Colors.red,
                    border: Border(
                        top:
                        BorderSide(width: 4, color: Color(0xff0CCDE6))))
                    : null,
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: currentIndex == 3 ? Color(0xff0CCDE6) : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Transform.rotate(
        angle: -math.pi / 4,
        child: Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: Color(0xff505051),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xff505051), width: 3),
          ),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Color(0xff0CCDE6),
            elevation: 5,
            highlightElevation: 5,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateKopa()));
            },
            child:
            Transform.rotate(angle: -math.pi / 4, child: Icon(Icons.add)),
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}


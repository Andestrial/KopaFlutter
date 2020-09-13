import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koap_app/data/repositories/user_repositories.dart';
import 'package:koap_app/domain/model/user_model.dart';
import 'package:koap_app/resources/colors_resources.dart';
import 'package:koap_app/resources/main_colors_resources.dart';
import 'package:koap_app/view/card/kopa_card_view.dart';
import 'package:koap_app/view/main_screens/home_screen_view.dart';

class ActiveAndArchive extends StatelessWidget {
  FirebaseUser user;

  ActiveAndArchive(this.user);

  final transparentCol = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: transparentCol,
        appBar: AppBar(
          backgroundColor: transparentCol,
          shadowColor: transparentCol,
          title: Theme(
            data: ThemeData(
              highlightColor: transparentCol,
              splashColor: transparentCol,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 1.0, color: Color(0xFF4B4B4B)),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ApplicationColors().lightBlue),
                tabs: [
                  Tab(
                    text: "Активні",
                  ),
                  Tab(
                    text: "Архів",
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: StreamBuilder(
//                initialData: "Loading...",
                  stream: Firestore.instance
                      .collection('posts')
                      .where('uid', isEqualTo: user.uid)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.data.documents.isEmpty) {
                      return Center(
                        child: Container(
                            alignment: Alignment.center,
                            height: 300,
                            child: Text(
                              "Немає оголошень",
                              style: TextStyle(color: whiteColBg, fontSize: 15),
                            )),
                      );
                    }
                    if (!snapshot.hasData) {
                      print('${snapshot.data}');
                      return Center(
                        child: Container(
                          alignment: Alignment.center,
                          height: 300,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    QuerySnapshot data = snapshot.data;
                    print('${data.documents}');
                    return Flexible(
                      child: ListView.builder(
                        itemCount: data.documents.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 18, 10),
                            child: KopaCard(data, i),
                          );
                        },
                      ),
                    );
                  }),
            ),
            Center(
              child: Container(
                  alignment: Alignment.center,
                  height: 300,
                  child: Text(
                    "Немає оголошень",
                    style: TextStyle(color: whiteColBg, fontSize: 15),
                  )),
            )
          ],
        ),
      ),
    );

  }
}

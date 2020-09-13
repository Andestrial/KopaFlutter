import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koap_app/data/repositories/user_repositories.dart';
import 'package:koap_app/resources/main_colors_resources.dart';
import '../card/kopa_card_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: size.width * 0.05),
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    backgroundColor: Color(0xff4E4E53),
                    context: context,
                    builder: (BuildContext bc) {
                      return SingleChildScrollView(
                        child: Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 3,
                                        backgroundColor: cyan,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        "Модель",
                                        style: TextStyle(fontSize: 14, color: whiteColMain),
                                      ),
                                    ],
                                  )),
                              DropdownButton(
                                  isExpanded: true,
                                  dropdownColor: gray,
                                  iconEnabledColor: cyan,
                                  iconSize: 24,
//                        elevation: 16,
                                  style: TextStyle(color: whiteColMain),
                                  underline: Container(
                                    height: 1,
                                    color: GrayColText,
                                  ),
                                  onChanged: (value) {},
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(''),
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Two'),
                                    ),
                                  ]),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 3,
                                        backgroundColor: cyan,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        "Матеріал",
                                        style: TextStyle(fontSize: 14, color: whiteColMain),
                                      ),
                                    ],
                                  )),
                              DropdownButton(
                                  isExpanded: true,
                                  dropdownColor: gray,
                                  iconEnabledColor: cyan,
                                  iconSize: 24,
//                        elevation: 16,
                                  style: TextStyle(color: whiteColMain),
                                  underline: Container(
                                    height: 1,
                                    color: GrayColText,
                                  ),
                                  onChanged: (value) {},
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(''),
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Two'),
                                    ),
                                  ]),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 3,
                                        backgroundColor: cyan,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        "Розмір",
                                        style: TextStyle(fontSize: 14, color: whiteColMain),
                                      ),
                                    ],
                                  )),
                              Row(
                                children: [
                                  Container(
                                    width: size.width * 0.2,
                                    child: DropdownButton(
                                        dropdownColor: gray,
                                        iconEnabledColor: cyan,
//                        elevation: 16,
                                        style: TextStyle(color: whiteColMain),
                                        underline: Container(
                                          height: 1,
                                          color: GrayColText,
                                        ),
                                        onChanged: (value) {},
                                        items: [
                                          DropdownMenuItem(
                                            child: Text(''),
                                          ),
                                          DropdownMenuItem(
                                            child: Text('Two'),
                                          ),
                                        ]),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: size.width * 0.2,
                                    child: DropdownButton(
                                        dropdownColor: gray,
                                        iconEnabledColor: cyan,
                                        style: TextStyle(color: whiteColMain),
                                        underline: Container(
                                          height: 1,
                                          color: GrayColText,
                                        ),
                                        onChanged: (value) {},
                                        items: [
                                          DropdownMenuItem(
                                            child: Text(''),
                                          ),
                                          DropdownMenuItem(
                                            child: Text('Two'),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 3,
                                        backgroundColor: cyan,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        "Ціна",
                                        style: TextStyle(fontSize: 14, color: whiteColMain),
                                      ),
                                    ],
                                  )),
                              Row(
                                children: [
                                  Container(
                                    width: size.width * 0.2,
                                    child: DropdownButton(
                                        dropdownColor: gray,
                                        iconEnabledColor: cyan,
//                        elevation: 16,
                                        style: TextStyle(color: whiteColMain),
                                        underline: Container(
                                          height: 1,
                                          color: GrayColText,
                                        ),
                                        onChanged: (value) {},
                                        items: [
                                          DropdownMenuItem(
                                            child: Text(''),
                                          ),
                                          DropdownMenuItem(
                                            child: Text('Two'),
                                          ),
                                        ]),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: size.width * 0.2,
                                    child: DropdownButton(
                                        iconSize: 24,
                                        elevation: 16,
                                        iconEnabledColor: cyan,
                                        dropdownColor: gray,
                                        style: TextStyle(color: whiteColMain),
                                        underline: Container(
                                          height: 1,
                                          color: GrayColText,
                                        ),
                                        onChanged: (value) {},
                                        items: [
                                          DropdownMenuItem(
                                            child: Text(''),
                                          ),
                                          DropdownMenuItem(
                                            child: Text('Two'),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                              SizedBox(height: 22,),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Text("СКАСУВАТИ",
                                      style: TextStyle(color: cyan),),
                                  ),
                                  SizedBox(width: 20,),
                                  InkWell(
                                    onTap: () {},
                                    child: Text("ЗАСТОСУВАТИ",
                                      style: TextStyle(color: cyan),),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.end,
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              icon: Icon(
                Icons.create,
                size: 25,
                color: Colors.grey,
              ),
            ),
          ),
          StreamBuilder(
            stream:  Firestore.instance.collection('posts').snapshots(),

            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.data == null) {return Center(child: CircularProgressIndicator(),);}

              if(snapshot.data.documents.isEmpty){
                return Center(child: Container(
                    alignment: Alignment.center,
                    height: 300,
                    child: Text("Немає оголошень" ,style: TextStyle(color: whiteColBg, fontSize: 15),)),
                );
              }
              if(!snapshot.hasData){
                print('${snapshot.data}');
                return  Center(child: Container(
                  alignment: Alignment.center,
                  height: 300,
                  child: CircularProgressIndicator(),),
                );

              }

              else{
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
              }
            },)
        ],

      ),

    );
  }
}
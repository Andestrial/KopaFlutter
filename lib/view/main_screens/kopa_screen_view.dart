import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:carousel_pro/carousel_pro.dart';

class KopaScreen extends StatefulWidget {
  @override
  _KopaScreenState createState() => _KopaScreenState();
}

class _KopaScreenState extends State<KopaScreen> {

  bool CurenntUser = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232326),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SafeArea(
                child: Container(
          decoration: BoxDecoration(
            color: Color(0xff343434),
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),),

//          height: MediaQuery.of(context).size.height ,
                  child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                  ),
                          height: 412,
                          child: Transform.rotate(
                            angle: 180 * math.pi / 360,
                              child: Carousel(
                                boxFit: BoxFit.cover,
                                dotIncreaseSize: 1.1,
                                autoplay: false,
                                dotBgColor: Colors.grey.withOpacity(0),
                                dotIncreasedColor: Colors.white,
                                dotColor: Colors.grey,
                                dotPosition: DotPosition.topLeft,
                                images: [
                                  imageForRotate('assets/BgImage.jpg'),
                                  imageForRotate("assets/Shape18.png"),
                                  imageForRotate('assets/Group26.png'),
                                ],
                              ),
                            ),
                          ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: 74,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Color(0xffFFD600),
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(width: 1),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                               blurRadius: 0.8,
                                            ),
                                          ]),
                                      child: Text("1000 \$", style: TextStyle(fontWeight: FontWeight.bold),),
                                    ),
                                   CurenntUser ? IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        print('Hello');
                                      },
                                    ) : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: IconButton(
                                       icon: Icon(
                                         Icons.favorite,
                                         size: 50,
                                         color: Colors.white,
                                       ),
                                       onPressed: () {
                                         print('Hello');
                                       },
                                   ),
                                    ) ,
                                  ],
                                ),
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Name of Kopa',
                                    style: TextStyle(fontSize: 22, color: Colors.white),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Size',
                                    style: TextStyle(fontSize: 10, color: Colors.white),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          '36',
                                          style:
                                              TextStyle(fontSize: 22, color: Colors.blue),
                                        ),
                                        Text(
                                          'EU',
                                          style:
                                              TextStyle(color: Colors.white, fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '36',
                                          style:
                                              TextStyle(fontSize: 14, color: Colors.blue),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          'высота',
                                          style:
                                              TextStyle(color: Colors.white, fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '36',
                                          style:
                                              TextStyle(fontSize: 14, color: Colors.blue),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          'длинна',
                                          style:
                                              TextStyle(color: Colors.white, fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Матеріал/Шкіра',
                                style: TextStyle(color: Color(0xff9A9A9A), fontSize: 10,),
                              ),
                              SizedBox(height: 10,),
                              Text('Опис товару'
                                  'sdsfsfsf'
                                  'dsfsdfsdf'
                                  'sdfsdfs'
                                  'asdasdasd'
                                  'asd'
                                  'sad'
                                  'sad'
                                  'sad'
                                  'sad'
                                  'sad'
                                  'sad'
                                  'sadsadsadasdsadsadsd', style: TextStyle(color:Color(0xff9A9A9A), fontSize: 12, ),),
                              SizedBox(height: 5,),
                            ],
                          ),
                        ),
                      ],
                    ),
                ),
              ),
                CurenntUser ? Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.05,
            child: FlatButton(
              color: Color(0xff0CCDE6),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              onPressed: () async {},
              child: Text(
                'Видалити оголошення',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ) :
    Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.5, horizontal: 10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          alignment: Alignment.center,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              leading: CircleAvatar(
                radius: 30,
              ),
              title: Text('Продавець', style: TextStyle(color: Colors.white),),
              subtitle: Text('Ukrain,Vinn', style: TextStyle(color: Colors.white)),
              trailing: Transform.rotate(
                  angle:  -math.pi / 4,
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color(0xff505051),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xff505051), width: 0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff007AFF),
                          blurRadius: 10,
                        )
                      ]
                    ),
                    child: RaisedButton(onPressed: () {  },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Color(0xff007AFF),
                    child: Container(
//                    alignment: Alignment.center,
                      child: Transform.rotate(
                          angle:  math.pi / 4,
                          child: Icon(Icons.phone, size: 28,)),
                    ),
                    ),
                  )),
            ),
          ),
    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageForRotate(String link) {
    return Container(
      child: Transform.rotate(
        angle: 180 * -math.pi / 360,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                link,
                fit: BoxFit.cover,
                height: 300,
              )),
        ),

    );
  }
}

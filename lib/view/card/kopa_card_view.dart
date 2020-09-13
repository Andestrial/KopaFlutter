import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main_screens/kopa_screen_view.dart';

class KopaCard extends StatelessWidget {

  QuerySnapshot data;
  int index;

  KopaCard(this.data, this.index);
  @override
  TextStyle cardTextStyle = TextStyle(color: Colors.white);

  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => KopaScreen(),
          ));
        },
        child: Container(
          width: 338,
          height: 140,
          decoration: BoxDecoration(
          color: Color(0xff343434),
    borderRadius: BorderRadius.circular(15),
    ),
        child : Stack(
        overflow: Overflow.visible,
    children: [

        Positioned(
          child:
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image:  NetworkImage(data.documents[index]['image'][0],),
                fit: BoxFit.fill,
              )
            ),

//            Image.asset('assets/Shape18.png')
          )),
        Positioned(
          child: Container(
              width: 55,
              height: 50,

                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: (){

                  },
                  child: Icon(Icons.favorite, color: Colors.grey[300], size: 30,), ),
              ),
        ),


        Positioned(
          left: MediaQuery.of(context).size.width * 0.41,
           child: Container(
                  width: MediaQuery.of(context).size.width * 0.58,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ListTile(
                    title: Text('${data.documents[index]['name']}' , style: cardTextStyle,),
                    subtitle: Text('Розмір :' , style: cardTextStyle,),
                    trailing: Container(
                      width: 74,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Color(0xffFFD600),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 0.8,
                          )
                        ]
                      ),
                      alignment: Alignment.center,
                      child: Text('${data.documents[index]['price']}\$' ,style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
    ),

        ),

        Positioned(
          left: MediaQuery.of(context).size.width * 0.45,
          top: MediaQuery.of(context).size.height * 0.085,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.width * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text('${data.documents[index]['size']}',style: TextStyle(fontSize: 20, color: Colors.blue),),
                        Text('EU', style: TextStyle(color: Colors.white, fontSize: 10,)),
                      ],
                    ),
                  ),
                     Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(data.documents[index]['width'],style: TextStyle(fontSize: 14, color: Colors.blue),),
                          SizedBox(height: 3,),
                          Text('ширина', style: TextStyle(color: Colors.white, fontSize: 10),),
                        ],
                      ),
                    ),

                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data.documents[index]['length'],style: TextStyle(fontSize: 14, color: Colors.blue),),
                        SizedBox(height: 3,),
                        Text('довжина', style: TextStyle(color: Colors.white, fontSize: 10),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ,

        Positioned(
          left: MediaQuery.of(context).size.width * 0.45,
          bottom: MediaQuery.of(context).size.height * 0.01,
          child: Text("Матеріал : ${data.documents[index]['material']}" ,style: TextStyle(color: Colors.grey, fontSize: 10),),

        )

    ]
    )
        ),
      );
  }

}



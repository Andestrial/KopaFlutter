import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


class KopaModel {

   String uid;
   String name;
   String size;
   String price;
   String material;
   String length ;
   String width;
   List<String> image;
   String description;


   Map<String, Object> toFirebase() {
      return {

         'uid': uid,
         'name': name,
         'size': size,
         'price': price,
         'material': material,
         'length': length,
         'width': width,
         'image' : image,
      };
   }

   KopaModel.fromJson(Map<String, dynamic> parsedJson) :
         uid = parsedJson['uid'],
         name = parsedJson['name'],
         size = parsedJson['size'],
         price = parsedJson['price'],
         material = parsedJson['material'],
         length = parsedJson['length'],
        width = parsedJson['width'],
         image = parsedJson['image'],
         description = parsedJson['description'];



  KopaModel({@required this.uid, @required this.name, @required this.size, @required this.price, this.material, this.length, this.width, this.image, this.description});
}
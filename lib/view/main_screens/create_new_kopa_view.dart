import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:koap_app/data/repositories/user_repositories.dart';
import 'package:koap_app/domain/model/kopa_model.dart';
import 'package:koap_app/resources/main_colors_resources.dart';


import 'dart:io';
import 'dart:math';
import 'dart:async';

import 'package:koap_app/soursec/database.dart';

bool formCheck = true;

String price, name, size, length, width, material, description;
List<String> imgUrls;

List sList() {
  double value = 16.0;

  List<String> sList = ['$value'];

  for (int i = 0; i < 64; i++) {
    value += 0.5;
    sList.add('$value');
  }

  return sList;
}

List lList() {
  double value = 9.5;

  List<String> lList = ['$value'];

  for (int i = 0; i < 47; i++) {
    value += 0.5;
    lList.add('$value');
  }

  return lList;
}

List wList() {
  double value = 6;

  List<String> wList = ['$value'];

  for (int i = 0; i < 12; i++) {
    value += 0.5;
    wList.add('$value');
  }

  return wList;
}

List<String> sizesList = sList();
List<String> lengthList = lList();
List<String> widthList = wList();

String sizesValue = sizesList[44];
String lengthValue = lengthList[30];
String widthValue = widthList[8];

const List<String> brandList = const [
  'Nike',
  'Adidas',
  'Puma',
  'Joma',
  'Lotto',
  'Umbro',
  'Mizuno',
  'Diadora',
  'Asics',
  'Kelme',
  'Under Armour',
  'Demix',
  'Reebok',
  'New Balance',
  'Fila',
  'Hummel',
  'Kappa',
];

String brandValue = brandList[0];

const List<String> materialList = const [
  'Натуральна шкіра',
  'Спеціальні штучні матеріали',
  'Штучна шкіра',
  'Замша',
  'Комбінована шкіра',
  'Замінник шкіри',
  'Нубук',
  'Повсть',
  'Текстиль',
];

String materialValue = materialList[0];
List<String> adsImgUrls = [];
int numController;

class CreateKopa extends StatefulWidget {
  @override
  _CreateKopaState createState() => _CreateKopaState();
}

class _CreateKopaState extends State<CreateKopa> {

  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();

  String _sizesValue, _lengthValue, _widthValue, _brandValue, _materialValue;

  final _textDescription = TextEditingController();
  final _textPrice = TextEditingController();

  bool _validateImg = false;
  bool _validateSize = false;
  bool _validateLength = false;
  bool _validateWidth = false;
  bool _validateBrand = false;
  bool _validateMaterial = false;
  bool _validateDescription = false;
  bool _validatePrice = false;
  bool _validatePriceNum = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlackCol,
      appBar: AppBar(
        backgroundColor: gray,
        title: Text('Додати взуття'),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 36,
            color: whiteColMain,
          ),
          onPressed: () {
            adsImgUrls.clear();
            Navigator.pop(context);
          },
          tooltip: 'Повернутися',
        ),
        actions: <Widget>[
          MaterialButton(
            child: Text(
              'Зберегти',
              style: TextStyle(
                color: cyan,
              ),
            ),
            onPressed: () async {
              setState(() {
                String pattern = r'^[0-9]+$';
                RegExp regex = new RegExp(pattern);

                adsImgUrls.length == 0 ? _validateImg = true : _validateImg = false;
                size == null ? _validateSize = true : _validateSize = false;
                length == null ? _validateLength = true : _validateLength = false;
                width == null ? _validateWidth = true : _validateWidth = false;
                name == null ? _validateBrand = true : _validateBrand = false;
                material == null ? _validateMaterial = true : _validateMaterial = false;
                _textDescription.text.isEmpty ? _validateDescription = true : _validateDescription = false;
                _textPrice.text.isEmpty ? _validatePrice = true : _validatePrice = false;
                !regex.hasMatch(_textPrice.text) || _textPrice.text == '0000' || _textPrice.text == '000' || _textPrice.text == '00' ? _validatePriceNum = true : _validatePriceNum = false;

                if (formCheck) {
                  Future.delayed(const Duration(milliseconds: 5), () {
                    formCheck = false;
                  });
                  Future.delayed(const Duration(seconds: 2), () {
                    formCheck = true;
                  });
                }

              });

              if (formCheck) {
                if (_validateImg == false &&
                    _validateSize == false &&
                    _validateLength == false &&
                    _validateWidth == false &&
                    _validateBrand == false &&
                    _validateMaterial == false &&
                    _validateDescription == false &&
                    _validatePrice == false &&
                    _validatePriceNum == false)
                {
                  _formKey.currentState.save();
                  final user = await UserRepositories().getCurrentUser();
                  KopaModel model = KopaModel(uid: user.uid, name: name, size: size, width: width, material: material, length: length, description: description, price: price, image: adsImgUrls);
                  print(model);
                  DocumentReference ref = await db.collection('posts').add(
                            model.toFirebase()
                  ).catchError((dataError) {
                    print(dataError);
                  });
                  id = ref.documentID;
                  Navigator.pop(context);
                  adsImgUrls.clear();
                } else {
                  print('Not correct data!');
                  /*Toast.show(
                    'Перевірте введені дані!',
                    context,
                    duration: Toast.LENGTH_LONG,
                    gravity: Toast.CENTER,
                    textColor: whiteColMain,
                    backgroundColor: errColBg,
                    backgroundRadius: 20.0,
                  );*/
                }
              } else {
                print('Excess click');
              }
            },
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: cyan,
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                          color: cyan,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      SizedBox(width: 7),
                      Text('Додати фото', style: TextStyle(fontSize: 16, color: whiteColMain)),
                    ],
                  ),
                ),
                Container(
                  color: gray,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          MaterialButton(
                            height: 78,
                            minWidth: 78,
                            color: cyan,
                            child: Icon(Icons.photo_camera, color: whiteColMain, size: 27),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            onPressed: ()  {
                              setState(() async {
                                await getImage();
                              });
                            },
                          ),

                          (adsImgUrls.length >= 1) ? SizedBox(width: (MediaQuery.of(context).size.width - 344)/3) : Container(),

                          (adsImgUrls.length >= 1) ? InkWell(
                            child: Container(
                              width: 78,
                              height: 78,
                              decoration: BoxDecoration(
                                color: whiteColBg,
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage('${adsImgUrls[0]}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () {},
                          ) : Container(),

                          (adsImgUrls.length >= 2) ? SizedBox(width: (MediaQuery.of(context).size.width - 344)/3) : Container(),

                          (adsImgUrls.length >= 2) ? InkWell(
                            child: Container(
                              width: 78,
                              height: 78,
                              decoration: BoxDecoration(
                                color: whiteColBg,
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage('${adsImgUrls[1]}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () {},
                          ) : Container(),

                          (adsImgUrls.length >= 3) ? SizedBox(width: (MediaQuery.of(context).size.width - 344)/3) : Container(),

                          (adsImgUrls.length >= 3) ? InkWell(
                            child: Container(
                              width: 78,
                              height: 78,
                              decoration: BoxDecoration(
                                color: whiteColBg,
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage('${adsImgUrls[2]}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () {},
                          ) : Container(),

                        ],
                      ),
                      (adsImgUrls.length >= 4) ? Padding(
                        padding: const EdgeInsets.only(top: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            (adsImgUrls.length >= 4) ? InkWell(
                              child: Container(
                                width: 78,
                                height: 78,
                                decoration: BoxDecoration(
                                  color: whiteColBg,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage('${adsImgUrls[3]}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () {},
                            ) : Container(),

                            (adsImgUrls.length >= 5) ? SizedBox(width: (MediaQuery.of(context).size.width - 344)/3) : Container(),

                            (adsImgUrls.length >= 5) ? InkWell(
                              child: Container(
                                width: 78,
                                height: 78,
                                decoration: BoxDecoration(
                                  color: whiteColBg,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage('${adsImgUrls[4]}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () {},
                            ) : Container(),

                            (adsImgUrls.length >= 6) ? SizedBox(width: (MediaQuery.of(context).size.width - 344)/3) : Container(),

                            (adsImgUrls.length >= 6) ? InkWell(
                              child: Container(
                                width: 78,
                                height: 78,
                                decoration: BoxDecoration(
                                  color: whiteColBg,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage('${adsImgUrls[5]}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () {},
                            ) : Container(),

                            (adsImgUrls.length >= 7) ? SizedBox(width: (MediaQuery.of(context).size.width - 344)/3) : Container(),

                            (adsImgUrls.length >= 7) ? InkWell(
                              child: Container(
                                width: 78,
                                height: 78,
                                decoration: BoxDecoration(
                                  color: whiteColBg,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage('${adsImgUrls[6]}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () {},
                            ) : Container(),

                          ],
                        ),
                      ) : Container(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                          color: cyan,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      SizedBox(width: 7),
                      Text('Розмір', style: TextStyle(fontSize: 16, color: whiteColMain)),
                    ],
                  ),
                ),
                Container(
                  color: gray,
                  padding: const EdgeInsets.only(top: 18, bottom: 26, left: 48, right: 16),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        child: Image.asset('assets/KopaImage.png', width: 67, height: 189),
                      ),
                      Positioned(
                        top: 51,
                        child: Image.asset('assets/ArrowHorizontal.png', width: 67),
                      ),
                      Positioned(
                        left: 88,
                        child: Image.asset('assets/ArrowVertical.png', height: 189),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 163.0),
                        child: Column(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Розмір', style: TextStyle(fontSize: 16, color: whiteColMain)),
                                DropdownButton(
                                  hint: Text('Розмір', style: TextStyle(color: GrayColText)),
                                  value: _sizesValue,
                                  dropdownColor: gray,
                                  style: TextStyle(
                                    color: whiteColMain,
                                  ),
                                  iconEnabledColor: _validateSize ? errColMain : cyan,
                                  isExpanded: true,
                                  items: sizesList.map((val) {
                                    return DropdownMenuItem(
                                      child: Text(val),
                                      value: val,
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      _sizesValue = val;
                                      size = val;
                                      size == null ? _validateSize = true : _validateSize = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Довжина / см', style: TextStyle(fontSize: 16, color: whiteColMain)),
                                DropdownButton(
                                  hint: Text('Довжина', style: TextStyle(color: GrayColText)),
                                  value: _lengthValue,
                                  dropdownColor: gray,
                                  style: TextStyle(
                                    color: whiteColMain,
                                  ),
                                  iconEnabledColor: _validateLength ? errColMain : cyan,
                                  isExpanded: true,
                                  items: lengthList.map((val) {
                                    return DropdownMenuItem(
                                      child: Text(val),
                                      value: val,
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      _lengthValue = val;
                                      length = val;
                                      length == null ? _validateLength = true : _validateLength = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Ширина / см', style: TextStyle(fontSize: 16, color: whiteColMain)),
                                DropdownButton(
                                  hint: Text('Ширина', style: TextStyle(color: GrayColText)),
                                  value: _widthValue,
                                  dropdownColor: gray,
                                  style: TextStyle(
                                    color: whiteColMain,
                                  ),
                                  iconEnabledColor: _validateWidth ? errColMain : cyan,
                                  isExpanded: true,
                                  items: widthList.map((val) {
                                    return DropdownMenuItem(
                                      child: Text(val),
                                      value: val,
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      _widthValue = val;
                                      width = val;
                                      width == null ? _validateWidth = true : _validateWidth = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                          color: cyan,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      SizedBox(width: 7),
                      Text('Модель', style: TextStyle(fontSize: 16, color: whiteColMain)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton(
                    hint: Text('Модель', style: TextStyle(color: GrayColText)),
                    value: _brandValue,
                    dropdownColor: gray,
                    style: TextStyle(
                      color: whiteColMain,
                    ),
                    iconEnabledColor: _validateBrand ? errColMain : cyan,
                    isExpanded: true,
                    items: brandList.map((val) {
                      return DropdownMenuItem(
                        child: Text(val),
                        value: val,
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _brandValue = val;
                        name = val;
                        name == null ? _validateBrand = true : _validateBrand = false;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                          color: cyan,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      SizedBox(width: 7),
                      Text('Матеріал', style: TextStyle(fontSize: 16, color: whiteColMain)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton(
                    hint: Text('Матеріал', style: TextStyle(color: GrayColText)),
                    value: _materialValue,
                    iconEnabledColor: _validateMaterial ? errColMain : cyan,
                    isExpanded: true,
                    dropdownColor: gray,
                    style: TextStyle(
                      color: whiteColMain,
                    ),
                    items: materialList.map((val) {
                      return DropdownMenuItem(
                        child: Text(val),
                        value: val,
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _materialValue = val;
                        material = val;
                        material == null ? _validateMaterial = true : _validateMaterial = false;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                          color: cyan,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      SizedBox(width: 7),
                      Text('Опис', style: TextStyle(fontSize: 16, color: whiteColMain)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _textDescription,
                    maxLength: 300,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    cursorColor: cyan,
                    style: TextStyle(
                      color: whiteColMain,
                    ),
                    decoration: InputDecoration(
                      counterStyle: TextStyle(color: GrayColText),
                      errorText: _validateDescription ? 'Поле не повинне бути порожнім' : null,
                      errorStyle: TextStyle(fontSize: 9, color: errColMain),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: GrayColText),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: cyan),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: errColMain),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: cyan),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        description = val;
                      });
                    },
                  ),
                ),
                Container(
                  color: gray,
                  margin: const EdgeInsets.only(top: 19),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 7,
                              width: 7,
                              decoration: BoxDecoration(
                                color: cyan,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            SizedBox(width: 7),
                            Text('Ціна (грн)', style: TextStyle(fontSize: 16, color: whiteColMain)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: _textPrice,
                          keyboardType: TextInputType.number,
                          cursorColor: cyan,
                          maxLength: 4,
                          style: TextStyle(
                            color: whiteColMain,
                          ),
                          decoration: InputDecoration(
                            counter: Offstage(),
                            errorText: _validatePrice ? 'Поле не повинне бути порожнім' : _validatePriceNum ? 'Невірна ціна' : null,
                            errorStyle: TextStyle(fontSize: 9, color: errColMain),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: GrayColText),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cyan),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: errColMain),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cyan),
                            ),
                          ),
                          onChanged: (val) {
                            setState(() {
                              price = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 14),
                    ],
                  ),
                ),
                Container(
                  height: 51,
                  child: _validateImg ? Center(child: Text('Додайте хоча б одне фото', style: TextStyle(color: errColMain),)) :
                  _validateSize ? Center(child: Text('Вкажіть розмір', style: TextStyle(color: errColMain),)) :
                  _validateLength ? Center(child: Text('Вкажіть довжину', style: TextStyle(color: errColMain),)) :
                  _validateWidth ? Center(child: Text('Вкажіть ширину', style: TextStyle(color: errColMain),)) :
                  _validateBrand ? Center(child: Text('Вкажіть модель взуття', style: TextStyle(color: errColMain),)) :
                  _validateMaterial ? Center(child: Text('Вкажіть матеріал', style: TextStyle(color: errColMain),)) :
                  _validateDescription ? Center(child: Text('Опишіть Ваше взуття', style: TextStyle(color: errColMain),)) :
                  _validatePrice ? Center(child: Text('Вкажіть ціну', style: TextStyle(color: errColMain),)) :
                  _validatePriceNum ? Center(child: Text('Невірна ціна', style: TextStyle(color: errColMain),)) :
                  Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addPathToDatabase(String text) async {
    try {
      final ref = FirebaseStorage().ref().child(text);
      var imageString = await ref.getDownloadURL();

      await Firestore.instance.collection('images').document().setData({'url':imageString, 'location':text});

      String imgUrlToArr = imageString.toString().replaceAll('[', '');
      imgUrlToArr = imgUrlToArr.toString().replaceAll(']', '');
      adsImgUrls.add('$imgUrlToArr');
      numController += 1;

    } catch(e){
      print(e.message);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message),
            );
          }
      );
    }
  }

  Future<String> _uploadImageToFirebase(File image) async {
    try {
      int randomNumber = Random().nextInt(1000);
      final timeNow = DateTime.now().millisecondsSinceEpoch;
      String imageLocation = 'images/$randomNumber$timeNow.jpg';

      final StorageReference storageReference = FirebaseStorage().ref().child(imageLocation);
      final StorageUploadTask uploadTask = storageReference.putFile(image);
      await uploadTask.onComplete;
      _addPathToDatabase(imageLocation);
      return imageLocation;
    } catch(e){
      print(e.message);
      return null;
    }
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _uploadImageToFirebase(image);
  }

}

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapp1/shared/Constants.dart';
import 'package:flutterapp1/widgets/BaseAppBar.dart';
import 'package:flutterapp1/widgets/DrawerWidget.dart';
import 'package:http/http.dart';

class ViewProduct extends StatefulWidget {
  final String drinkID;
  final String drinkName;
  const ViewProduct({Key key, this.drinkID, this.drinkName}) : super(key: key);
  @override
  _ViewProductState createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  Size screenSize;
  Map data;
  var drink;

  void initState() {
    super.initState();

    drinkData(widget.drinkID).then((value) {
      setState(() {
        data = jsonDecode(value.body);
        drink = data['drinks'][0];
      });
    });
  }

  Future<Response> drinkData(drinkID) async {
    Response response = await get(
        'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$drinkID');
    return response;
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey[200],
      appBar: BaseAppBar(
          title: Text(widget.drinkName,
              style:
                  styleRobotoBold.copyWith(fontSize: 18, color: Colors.white)),
          appBar: AppBar()),
      endDrawer: DrawerWidget(),

      //Body
      body: data == null
          ? Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[50],
                  ),
                  width: screenSize.width,
                  //height: screenSize.height,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(drink['strDrink'],
                            style: styleOpenSans.copyWith(
                                letterSpacing: .2,
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                decoration: TextDecoration.underline)),
                        SizedBox(height: 10),
                        Container(
                          width: screenSize.width * .5,
                          height: screenSize.height * .3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(drink['strDrinkThumb'])),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Column(
                            children: [
                              Text('Mixing Instructions: ',
                                  style: styleOpenSans.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text(drink['strInstructions'],
                                  style: styleOpenSans.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900)),
                              SizedBox(height: 15),
                              Text('Ingredients: ',
                                  style: styleOpenSans.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic)),
                              drink['strIngredient1'] != null
                                  ? Text(drink['strIngredient1'],
                                      style: styleOpenSans.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))
                                  : Text('',
                                      style: styleOpenSans.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                              drink['strIngredient2'] != null
                                  ? Text(drink['strIngredient2'],
                                      style: styleOpenSans.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))
                                  : Text('',
                                      style: styleOpenSans.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                              drink['strIngredient3'] != null
                                  ? Text(drink['strIngredient3'],
                                      style: styleOpenSans.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))
                                  : Text('',
                                      style: styleOpenSans.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                              drink['strIngredient4'] != null
                                  ? Text(drink['strIngredient4'],
                                      style: styleOpenSans.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))
                                  : Text('',
                                      style: styleOpenSans.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                              drink['strIngredient5'] != null
                                  ? Text(drink['strIngredient5'],
                                      style: styleOpenSans.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))
                                  : Text('',
                                      style: styleOpenSans.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
    );
  }
}

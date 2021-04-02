import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp1/screens/ViewProduct.dart';
import 'package:flutterapp1/shared/Constants.dart';
import 'package:flutterapp1/widgets/BaseAppBar.dart';
import 'package:flutterapp1/widgets/DrawerWidget.dart';
import 'package:http/http.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Size screenSize;
  int productCount;
  Map data;
  String drinksURL =
      'https://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Champagne_flute';

  void initState() {
    super.initState();

    getDrinks().then((value) {
      setState(() {
        data = jsonDecode(value.body);
        productCount = data['drinks'].length;
      });
    });
  }

  Future<Response> getDrinks() async {
    Response response = await get(drinksURL);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey[200],
      appBar: BaseAppBar(
          title: Text('HOME',
              style:
                  styleRobotoBold.copyWith(fontSize: 18, color: Colors.white)),
          appBar: AppBar()),
      endDrawer: DrawerWidget(),
      //ListView
      body: data == null
          ? Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: screenSize.width,
              height: screenSize.height,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: productCount,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  var drink = data['drinks'][index];
                  //print(data['drinks'][index]['strDrinkThumb']);

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ViewProduct(
                                  drinkID: drink['idDrink'],
                                  drinkName: drink['strDrink'])));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 2,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[50],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            drink['strDrink'],
                            style: styleOpenSans.copyWith(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(drink['strDrinkThumb'])),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ButtonTheme(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    primary: Colors.blue[900],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    print('Button Clicked');
                                  },
                                  child: Text(
                                    "BUY",
                                    style: styleRobotoBold.copyWith(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              ButtonTheme(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    primary: Colors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    print('Button Clicked');
                                  },
                                  child: Text(
                                    "CART",
                                    style: styleRobotoBold.copyWith(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

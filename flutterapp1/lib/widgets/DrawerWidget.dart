import 'package:flutter/material.dart';
import 'package:flutterapp1/shared/Constants.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 50),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/icon.jpg')),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          SizedBox(height: 20),
          Text("Edrick Valencia",
              style: styleRobotoBold.copyWith(
                  letterSpacing: 0.1,
                  fontSize: 24,
                  fontWeight: FontWeight.w900)),
          Text("BSIT - Ateneo de Davao University",
              style: styleOpenSans.copyWith(color: Colors.black, fontSize: 16))
        ],
      ),
    );
  }
}

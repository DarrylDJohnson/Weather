import 'dart:io';

import 'package:flutter/material.dart';

class DoublePressToExit extends StatelessWidget {
  final Widget child;

  const DoublePressToExit({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        child: child,
        onWillPop: () async {
          if (ModalRoute.of(context).isFirst) {
            return showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Are you sure you want to exit?"),
                    actions: [
                      FlatButton(
                        child: Text("Yes"),
                        onPressed: () => exit(0),
                      ),
                      FlatButton(
                        child: Text("No"),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                    ],
                  ),
                ) ??
                false;
          }

          return true;
        },
      ),
    );
  }
}

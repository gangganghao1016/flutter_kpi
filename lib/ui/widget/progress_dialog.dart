
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kpi/res/styles.dart';

class ProgressDialog extends Dialog{

  ProgressDialog({
    Key key,
    this.hintText
  }) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 88.0,
          width: 120.0,
          decoration: ShapeDecoration(
              color: Color(0xFF3A3A3A),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoActivityIndicator(radius: 14.0),
              Gaps.vGap8,
              Text(hintText, style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
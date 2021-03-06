import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key key, this.text, this.press, this.isLoading: false})
      : super(key: key);
  final String text;
  final bool isLoading;
  final Function press;

  @override
  Widget build(BuildContext context) {
    final Loading = SpinKitFadingCircle(
      color: Colors.white,
      size: 40.0,
    );
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: kPrimaryColor,
        onPressed: press,
        child: !isLoading
            ? Text(
                text,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.white,
                ),
              )
            : Loading,
      ),
    );
  }
}

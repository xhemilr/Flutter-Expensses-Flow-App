import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptiveButton extends StatelessWidget {
  final String _buttonText = 'Choose Date';
  final Function _presentDatePicker;

  AdaptiveButton(this._presentDatePicker);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ?
    CupertinoButton(
      child: Text(
        _buttonText,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme
                .of(context)
                .primaryColor
        ),
      ),
      onPressed: _presentDatePicker,
    )
        :
    FlatButton(
      textColor: Theme
          .of(context)
          .primaryColor,
      child: Text(
        _buttonText,
        style: TextStyle(
            fontWeight: FontWeight.bold
        ),
      ),
      onPressed: _presentDatePicker,
    );
  }


}

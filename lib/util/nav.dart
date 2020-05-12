
import 'package:flutter/material.dart';

push (BuildContext context, Widget page, {replace: false}) {

  if(replace) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  } else {
    return Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }
}

bool pop <T extends Object> (BuildContext context, [T result]) {
  return Navigator.pop(context);
}
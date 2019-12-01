import 'package:flutter/material.dart';

class RaisedShadow {
  static List<BoxShadow> defaultShadow() {
    return <BoxShadow>[
      BoxShadow(
        blurRadius: 8,
        color: Colors.black.withOpacity(.2),
        offset: Offset(3, 3),
      ),
      BoxShadow(
        blurRadius: 8,
        color: Colors.white,
        offset: Offset(-3, -3),
      ),
      BoxShadow(
        blurRadius: 2,
        color: Colors.white.withOpacity(0.5),
        offset: Offset(.4, .4),
      ),
    ];
  }

  static List<BoxShadow> defaultShadowWithColor(Color color) {
    return <BoxShadow>[
      BoxShadow(
        blurRadius: 8,
        color: color.withOpacity(.1),
        offset: Offset(3, 3),
      ),
      BoxShadow(
        blurRadius: 8,
        color: Color.alphaBlend(color, Colors.white),
        offset: Offset(-3, -3),
      ),
      BoxShadow(
        blurRadius: 2,
        color: Color.alphaBlend(color, Colors.white).withOpacity(0.5),
        offset: Offset(.4, .4),
      )
    ];
  }
}

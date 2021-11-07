import 'package:flutter/material.dart';



extension ContextExtencion on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get heigth => MediaQuery.of(this).size.height;
}

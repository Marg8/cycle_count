import 'package:flutter/material.dart';

class Buttom extends StatelessWidget {
  final String title;
  final VoidCallback onTab;
  final Icon? icon;
  final Color? color;
  final EdgeInsets? padding;
  const Buttom({required this.title,required this.onTab, this.icon, this.color, this.padding, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onTab,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(this.color),
        padding: MaterialStateProperty.all(this.padding),
      ), 
      child: this.icon != null 
      ? Row(
        children: [
          this.icon!,
          SizedBox(width: 5),
          Text("${this.title}")
        ],
      )
      : Text("${this.title}")
       );
  }
}

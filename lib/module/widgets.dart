import 'estension.dart';
import 'package:flutter/material.dart';

enum ButtonType { Save, New, Delete, Cancel }

class Label extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final bool bold;
  const Label(this.title,
      {Key? key, this.fontSize, this.color, this.bold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal),
    );
  }
}

class Button extends StatelessWidget {
  final String? title;
  final VoidCallback onTab;
  final Icon? icon;
  final ButtonType? type;
  final Color? color;
  final EdgeInsets? padding;
  const Button(
      {this.title,
      required this.onTab,
      this.icon,
      this.color,
      this.padding,
      Key? key,
      this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTab,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color != null
              ? color
              : type == ButtonType.Save
                  ? Colors.green
                  : type == ButtonType.Cancel
                      ? Colors.deepOrangeAccent
                      : type == ButtonType.Delete
                          ? Colors.redAccent
                          : type == ButtonType.New
                              ? Colors.blue
                              : null),
          padding: MaterialStateProperty.all(padding),
        ),
        child: icon == null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon ??
                      Icon(
                        type == ButtonType.Save
                            ? Icons.save
                            : type == ButtonType.Cancel
                                ? Icons.cancel
                                : type == ButtonType.Delete
                                    ? Icons.delete
                                    : type == ButtonType.New
                                        ? Icons.add_box
                                        : null,
                        size: 15,
                      ),
                  const SizedBox(width: 5),
                  title != null
                  ?title!.toLabel()
                  :type == ButtonType.Save
                      ? "Save".toLabel()
                      : type == ButtonType.Cancel
                          ? "Cancel".toLabel()
                          : type == ButtonType.Delete
                              ? "Delete".toLabel()
                              : type == ButtonType.New
                                  ? "New".toLabel()
                                  : "$title".toLabel()
                  // ignore: unnecessary_string_interpolations
                ],
              )
            : icon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      icon!,
                      const SizedBox(width: 5),
                      "$title".toLabel()
                    ],
                  )
                : "$title".toLabel());
  }
}

class Edit extends StatelessWidget {
  final String hint;
  final Function(String)? onChange;
  final bool autoFocus;
  final bool password;
  final bool notempty;
  final TextEditingController? controller;
  const Edit(
      {Key? key,
      required this.hint,
      this.autoFocus = false,
      this.password = false,
      this.controller,
      this.onChange,
      this.notempty = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            gapPadding: 20,
          ),
          labelText: hint,
          labelStyle: TextStyle(color: Colors.grey.shade400, fontSize: 18)),
      obscureText: password,
      controller: controller,
      onChanged: onChange,
      validator: (val) {
        if ((val ?? "").isEmpty && this.notempty) {
          return "cannot be empty";
        }
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import 'estension.dart';
import 'package:flutter/material.dart';

enum ButtonType { Save, New, Delete, Cancel }

class MBloc<t> {
  BehaviorSubject<t> _bloc = BehaviorSubject<t>();
  Stream<t> get stream => _bloc.stream;
  t get value => _bloc.value;

  void setValue(t val) => _bloc.add(val);
}

class MLabel extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final bool bold;
  const MLabel(this.title,
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

class MButton extends StatelessWidget {
  final String? title;
  final VoidCallback onTab;
  final Icon? icon;
  final ButtonType? type;
  final Color? color;
  final EdgeInsets? padding;
  const MButton(
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
                      ? title!.toLabel()
                      : type == ButtonType.Save
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

class MTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  const MTextButton(
      {Key? key, required this.title, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: title.toLabel(color: color));
  }
}

class MEdit extends StatelessWidget {
  final String hint;
  final Function(String)? onChange;
  final bool autoFocus;
  final bool password;
  final bool notempty;
  final TextEditingController? controller;
  const MEdit(
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
        if ((val ?? "").isEmpty && notempty) {
          return "cannot be empty";
        }
      },
    );
  }
}

class MSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChange;
  final String? hint;
  const MSwitch(
      {Key? key, required this.value, required this.onChange, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MBloc<bool> _value = MBloc<bool>()..setValue(value);
    return StreamBuilder<bool>(
      stream: _value.stream,
      builder: (_, snap) {
        if (snap.hasData) {
          return hint != null
              ? Tooltip(
                  message: hint!,
                  child: Switch(
                    value: snap.data!,
                    onChanged: (val) {
                      onChange(val);
                      _value.setValue(val);
                    },
                  ),
                )
              : Switch(
                  value: snap.data!,
                  onChanged: (val) {
                    onChange(val);
                    _value.setValue(val);
                  },
                );
        }
        return Container();
      },
    );
  }
}

class MError extends StatelessWidget {
  final Exception exception;
  const MError({Key? key, required this.exception}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(12)),
      child: exception.toString().toLabel(color: Colors.white, bold: true),
    );
  }
}

class MWaiting extends StatelessWidget {
  const MWaiting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoActivityIndicator().center;
  }
}

class MSiderBarItems extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final int value;
  final bool selected;
  const MSiderBarItems(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onTap,
      this.value = 0, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      selectedTileColor: Colors.green.shade100,
      title: title.toLabel(color: Colors.grey.shade500, fontsize: 15),
      leading: Icon(icon, size: 15, color: Colors.grey.shade500),
      trailing: value > 0
          ? CircleAvatar(
              backgroundColor: Colors.purple,
              radius: 10,
              child: "$value".toLabel(fontsize: 10),
            )
          : null,
      onTap: onTap,
    );
  }
}

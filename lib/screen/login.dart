import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc_state.dart';
import '../bloc/user_bloc.dart';
import '../module/estension.dart';
import '../module/widgets.dart';

  TextEditingController _mobile = TextEditingController();
TextEditingController _pass = TextEditingController();

class Login extends StatelessWidget {
  final BlocState state;

  Login({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: context.width * 0.3 < 350 ? 350 : context.width * 0.3,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                "Wellcome"
                    .toLabel(bold: true, color: Colors.grey, fontsize: 32)
                    .margin9,
                Edit(
                  hint: "User Name",
                  controller: _mobile,
                  notempty: true,
                ).margin9,
                Edit(
                  hint: "Password",
                  controller: _pass,
                  notempty: true,
                  password: true,
                ).margin9,
                AbsorbPointer(
                  absorbing: state is Loading,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      state is Loading
                          ? const CupertinoActivityIndicator()
                          : Container(),
                      Button(
                        title: "Login",
                        icon: const Icon(Icons.vpn_key),
                        padding: const EdgeInsets.all(22),
                        color: Colors.blue,
                        onTab: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .userBloc!
                                .authenticate(_mobile.text, _pass.text);
                          }
                        },
                      ).margin9,
                      Button(
                        title: "Register",
                        icon: const Icon(Icons.edit),
                        padding: const EdgeInsets.all(22),
                        color: Colors.green,
                        onTab: () => print("Cliked"),
                      ).margin9,

                      // Button(
                      //   type: ButtonType.Save,
                      //   title: "save",
                      //   padding: const EdgeInsets.all(22),
                      //   onTab: () {},
                      // ).margin9,
                    ],
                  ),
                ),
                state is Failed
                    ? Container(
                        margin: EdgeInsets.all(25),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12)),
                        child: (state as Failed)
                            .exception
                            .toString()
                            .toLabel(color: Colors.white, bold: true),
                      )
                    : Container()
                // Row(
                //   children: [
                //     Button(
                //       type: ButtonType.New,
                //       title: "save",
                //       padding: const EdgeInsets.all(22),
                //       onTab: () {},
                //     ).margin9,
                //     Button(
                //       type: ButtonType.Cancel,
                //       title: "save",
                //       padding: const EdgeInsets.all(22),
                //       onTab: () {},
                //     ).margin9,
                //     Button(
                //       type: ButtonType.Delete,
                //       title: "save",
                //       padding: const EdgeInsets.all(22),
                //       onTab: () {},

                //     ).margin9
                //   ],
                // )
              ],
            ),
          ),
        ).padding9.card.center,
      ),
    );
  }
}

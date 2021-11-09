import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc_state.dart';
import '../bloc/user_bloc.dart';
import '../module/estension.dart';
import '../module/widgets.dart';

TextEditingController _mobile = TextEditingController();
TextEditingController _pass = TextEditingController();
bool _remember = false;

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
                MEdit(
                  hint: "User Name",
                  controller: _mobile,
                  notempty: true,
                ).margin9,
                MEdit(
                  hint: "Password",
                  controller: _pass,
                  notempty: true,
                  password: true,
                ).margin9,
                AbsorbPointer(
                  absorbing: state is Loading,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MSwitch(
                              value: _remember,
                              onChange: (val) =>
                                _remember = val
                              ),
                          "Remeber me!".toLabel(),
                          const Spacer(),
                          MTextButton(title: "register", onPressed: () {})
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          
                          MButton(
                            title: "Login",
                            icon: const Icon(Icons.vpn_key),
                            padding: const EdgeInsets.all(22),
                            color: Colors.blue,
                            onTab: () {
                              if (_formKey.currentState!.validate()) {
                                context.userBloc!
                                    .authenticate(_mobile.text, _pass.text, _remember);
                              }
                            },
                          ).margin9,
                          state is Loading
                              ? const MWaiting()
                              : Container(),
                          const Spacer(),
                          MTextButton(
                              title: "Forgot my Password", onPressed: () {})
                        ],
                      ),
                    ],
                  ),
                ),
                state is Failed
                    ? MError(exception:(state as Failed).exception)
                    : Container()
              ],
            ),
          ),
        ).padding9.card.center,
      ),
    );
  }
}

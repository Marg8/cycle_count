import 'package:cycle_count/bloc/user_bloc.dart';
import 'package:cycle_count/module/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../module/estension.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          "hello${context.user!.family}".toLabel(),
          Button(
            type: ButtonType.Cancel,
            title: "Sign Out",
            onTab: () {
              context.userBloc!.signOut();
            },
          )
        ],
      ).center),
    );
  }
}

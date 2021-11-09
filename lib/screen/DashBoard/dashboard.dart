import 'package:cycle_count/bloc/user_bloc.dart';
import 'package:cycle_count/module/widgets.dart';
import 'package:cycle_count/screen/DashBoard/side_bar.dart';
import 'package:cycle_count/screen/DashBoard/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../../module/estension.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
            children: [
              SideBar(),
              Container(
                color: Colors.blue.shade100,
                
              ).expand,
              UserInfo()
            ],
          )
      ),
    );
  }
}

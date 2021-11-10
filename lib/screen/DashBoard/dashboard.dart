import 'package:cycle_count/bloc/user_bloc.dart';
import 'package:cycle_count/module/widgets.dart';
import 'package:cycle_count/screen/DashBoard/side_bar.dart';
import 'package:cycle_count/screen/DashBoard/user_info.dart';
import 'package:cycle_count/screen/Teachers/Teachers.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../../module/estension.dart';

MBloc<int> _menu = MBloc<int>()..setValue(1);
MBloc<int> _dashmenu = MBloc<int>()..setValue(1);
MBloc<int> _dashhover = MBloc<int>()..setValue(0);

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder<Object>(
              stream: _menu.stream,
              builder: (context, snap) {
                if (!snap.hasData) return const MWaiting();
                return Row(
                  children: [
                    SideBar(
                        selectx: _menu.value,
                        onChange: (val) => _menu.setValue(val)),
                    Container(
                            child: snap.data == 1
                                ? const DashBoardContent()
                                : "Somthing else".toLabel().center)
                        .expand,
                    UserInfo(),
                  ],
                );
              })),
    );
  }
}

class DashBoardContent extends StatelessWidget {
  const DashBoardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: _dashmenu.stream,
        builder: (context, snap) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300,
                child: MEdit(hint: "Search..."),
              ).padding9,
              const SizedBox(
                height: 35,
              ),
              // Container(
              //    decoration: BoxDecoration(
              //         border: Border(
              //             bottom:
              //                 BorderSide(color: Colors.grey.shade200, width: 1)))
              // ),
              //Top Menu

              Row(
                children: [
                  GestureDetector(
                    onTap: () => _dashmenu.setValue(1),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: (snap.data ?? 0) == 1
                                      ? Colors.green.shade200
                                      : Colors.grey.shade200,
                                  width: 1))),
                      padding: const EdgeInsets.only(bottom: 15),
                      child: "Teacher"
                          .toLabel(
                            color: (snap.data ?? 0) == 1
                                ? Colors.green.shade200
                                : Colors.black,
                          )
                          .center,
                    ).hMargin9,
                  ),
                  GestureDetector(
                    onTap: () => _dashmenu.setValue(2),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: (snap.data ?? 0) == 2
                                      ? Colors.green.shade200
                                      : Colors.grey.shade200,
                                  width: 1))),
                      padding: EdgeInsets.only(bottom: 15),
                      child: "Student"
                          .toLabel(
                            color: (snap.data ?? 0) == 2
                                ? Colors.green.shade200
                                : Colors.black,
                          )
                          .center,
                    ).hMargin9,
                  ),
                  GestureDetector(
                    onTap: () => _dashmenu.setValue(3),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: (snap.data ?? 0) == 3
                                      ? Colors.green.shade200
                                      : Colors.grey.shade200,
                                  width: 1))),
                      padding: const EdgeInsets.only(bottom: 15),
                      child: "Class"
                          .toLabel(
                              color: (snap.data ?? 0) == 3
                                  ? Colors.green.shade200
                                  : Colors.black)
                          .center,
                    ).hMargin9,
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.shade200, width: 1))),
                    padding: const EdgeInsets.only(bottom: 15),
                    child: "".toLabel(color: Colors.green).center,
                  ).hMargin9,

                 
                ],
              ),
               (snap.data ?? 0) == 1
                  ? const Teachers().expand
                  : "Others".toLabel().center
            ],
          );
        });
  }
}

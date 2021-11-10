import 'package:cycle_count/module/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cycle_count/module/estension.dart';

class SideBar extends StatelessWidget {
  final Function(int) onChange;
  final int selectx;
  const SideBar({Key? key, required this.onChange,required this.selectx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Container(
        width: context.widthResponse(0.23, 200, 250),
        child: Column(
                children: [
                  const SizedBox(height: 35),
                  "School".toLabel(
                      fontsize: 22, color: Colors.grey.shade600, bold: true),
                  const SizedBox(height: 75),
                  MSiderBarItems(
                    title: "Dashboard",
                    icon: Icons.dashboard,
                    selected: selectx == 1,
                    onTap: () {
                      onChange(1);
                      
                    },
                  ),
                  MSiderBarItems(
                    title: "Messenger",
                    icon: Icons.messenger,
                    value: 8,
                    selected: selectx == 2,
                    onTap: () {
                      onChange(2);
                      
                    },
                  ),
                  MSiderBarItems(
                    title: "Teachers",
                    icon: Icons.person,
                    selected: selectx == 3,
                    onTap: () {
                      onChange(3);
                      
                    },
                  ),
                  MSiderBarItems(
                    title: "Students",
                    icon: Icons.people,
                    value: 8,
                    selected: selectx == 4,
                    onTap: () {
                      onChange(4);
                      
                    },
                  ),
                  MSiderBarItems(
                    title: "Clasess",
                    icon: Icons.menu_book_sharp,
                    selected: selectx == 5,
                    onTap: () {
                      onChange(5);
                      
                    },
                   
                  ),
                  const SizedBox(height: 100),
                  MSiderBarItems(
                    title: "Settings",
                    icon: Icons.settings,
                    selected: selectx == 6,
                    onTap: () {
                      onChange(6);
                   
                    },
                  ),
                ],
              ).padding9
        
            );
  }
}
// Minuto 57:19 de Video Parte 3 de 1.40 minutos

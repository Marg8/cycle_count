import 'package:cycle_count/module/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cycle_count/module/estension.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Container(
        width: context.width * 0.2 < 250 ? 250 : context.width * 0.2,
        child: Column(
          children: [
            const SizedBox(height: 35),
            "School"
                .toLabel(fontsize: 22, color: Colors.grey.shade600, bold: true),
            const SizedBox(height: 75),
            ListTile(
              hoverColor: Colors.blueAccent.shade100,
              title: "Dashboard".toLabel(color: Colors.grey.shade500),
              leading: Icon(Icons.dashboard,size: 18,color: Colors.grey.shade500,),
              onTap: (){},
            ),

            ListTile(
              hoverColor: Colors.blueAccent.shade100,
              title: "Teachers".toLabel(color: Colors.grey.shade500),
              leading: Icon(
                Icons.person,
                size: 18,
                color: Colors.grey.shade500,
              ),
              onTap: () {},
            ),

            ListTile(
              hoverColor: Colors.blueAccent.shade100,
              title: "Students".toLabel(color: Colors.grey.shade500),
              leading: Icon(
                Icons.people,
                size: 18,
                color: Colors.grey.shade500,
              ),
              onTap: () {},
            ),

            ListTile(
              hoverColor: Colors.blueAccent.shade100,
              title: "Clasess".toLabel(color: Colors.grey.shade500),
              leading: Icon(
                Icons.menu_book_sharp,
                size: 18,
                color: Colors.grey.shade500,
              ),
              onTap: () {},
            ),

            ListTile(
              hoverColor: Colors.blueAccent.shade100,
              title: "Dashboard".toLabel(color: Colors.grey.shade500),
              leading: Icon(
                Icons.dashboard,
                size: 18,
                color: Colors.grey.shade500,
              ),
              onTap: () {},
            ),
            
          ],
        ).padding9);
  }
}
// Minuto 57:19 de Video Parte 3 de 1.40 minutos

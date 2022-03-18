import 'package:blogspot/src/shared_widgets/base.page.dart';
import 'package:blogspot/src/views/homepage/home.page.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Dashboard',
      body: PageView(
        children: const [
          HomePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: 'Kategori')
        ],
      ),
    );
  }
}

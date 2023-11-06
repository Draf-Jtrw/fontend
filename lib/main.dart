import 'package:flutter/material.dart';
import 'package:testapi/page/home_page.dart';
import 'package:testapi/page/order_page.dart';
import 'dart:async';
import 'Services.dart';
import 'models/foods.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;

  final tabs = [HomePage(), OrderPage()];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_work_outlined,
              color: Colors.black,
            ),
            label: 'หน้าแรก',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
              color: Colors.black,
            ),
            label: 'คำสั่งซื้อ',
            backgroundColor: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

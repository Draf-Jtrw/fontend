import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testapi/Services.dart';
import 'package:testapi/Services_basket.dart';
import 'package:testapi/models/food.dart';
import 'package:testapi/models/foods.dart';
import 'package:testapi/page/data.dart';
import 'package:testapi/page/userPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Foods foods;
  bool isLoading = false;
  final debouncer = Debouncer(milliseconds: 1000);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    foods = Foods();

    Services.getFoods().then((foodsFromServer) {
      setState(() {
        foods = foodsFromServer;
        isLoading = false;
      });
    });

  }

  Widget searchTF() {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(15.0),
        hintText: 'ใส่ชื่ออาหารที่คุณต้องการ'
      ),
      onChanged: (string) {
        debouncer.run(() {
          Services.getFoods().then((foodsFromServer) {
            setState(() {
              foods = Foods.filterList(foodsFromServer, string);
            });
          });
        });
      },
    );
  }

  Widget list() {
    if (foods == null) {
      return CircularProgressIndicator();
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: foods.foods == null ? 0 : foods.foods.length,
          itemBuilder: (BuildContext context, int index) {
            return row(index);
          },
        ),
      );
    }
  }

  Widget row(int index){
    if (foods.foods != null && index < foods.foods.length) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: // isLoading ? const Center(
          //   child: CircularProgressIndicator(),):
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: Image.network(foods.foods[index].pic, height: 100, width: 100,),
                title: Text('${foods.foods[index].type}: ${foods.foods[index].name}'),
                subtitle: Text('ราคา: ${foods.foods[index].price} บาท'),
                trailing: const Icon(Icons.add_circle),
                onTap: (){
                  _showFoodDetailsDialog(foods.foods[index]);
                },
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  void _showFoodDetailsDialog(Food food) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int quantity = 1;
        return AlertDialog(
          content: Container(
            width: 300,
            height: 200,
            child: Column(
              children: <Widget>[
                Image.network(food.pic, width: 100, height: 100),
                Text('${food.type}'),
                Text('${food.name}'),
                Text('ราคา  ${food.price}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('จำนวน '),
                    Text('$quantity'),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                child: Text('เพิ่มลงตะกร้า'),
                onPressed: (){
                  ServicesBasket.data_str(food.fid.toString());
                  Navigator.of(context).pop(
                    MaterialPageRoute(builder: (context) => Data())
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle_rounded),
          iconSize: 40,
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserPage(),
                )
            );
          },
        ),
        title: Text('Giant Food', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            iconSize: 40,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Data()
                ),
              );
            },
          ),
          Text('    ')
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: isLoading ? const Center(
          child: CircularProgressIndicator(),
        ):Column(
          children: <Widget>[
            searchTF(),
            SizedBox(height: 20.0,),
            list(),
          ],
        ),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if(null != _timer){
      _timer?.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
import 'package:flutter/material.dart';
import 'package:testapi/ServicesHistory.dart';
import 'package:testapi/Services_order.dart';
import 'package:testapi/models/index.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  late Orders orders;
  late Historys historys;
  late Historys historyCan;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orders = Orders();
    historys = Historys();
    historyCan = Historys();
    isLoading = true;

    ServicesOrder.getOrder().then((ordersFromServer) {
      setState(() {
        orders = ordersFromServer;
        isLoading = false;
      });
    });

    ServicesHistory.getSuc().then((historyFromServer){
      setState(() {
        historys = historyFromServer;
        isLoading = false;
      });
    });

    ServicesHistory.getCan().then((historyFromServer){
      setState(() {
        historyCan = historyFromServer;
        isLoading = false;
      });
    });
  }

  void reloadData() {
    setState(() {
      isLoading = true;
    });

    // เรียกใช้งานบริการ API เพื่อดึงข้อมูลใหม่
    ServicesOrder.getOrder().then((ordersFromServer) {
      setState(() {
        orders = ordersFromServer;
        isLoading = false;
      });
    });

    // เรียกใช้งานบริการ API เพื่อดึงข้อมูล historys ใหม่
    ServicesHistory.getSuc().then((historyFromServer) {
      setState(() {
        historys = historyFromServer;
        isLoading = false;
      });
    });

    // เรียกใช้งานบริการ API เพื่อดึงข้อมูล historyCan ใหม่
    ServicesHistory.getCan().then((historyFromServer) {
      setState(() {
        historyCan = historyFromServer;
        isLoading = false;
      });
    });
  }

  Widget listProgress() {
    return Expanded(
      child: ListView.builder(
        itemCount: orders.orders == null ? 0 : orders.orders.length,
        itemBuilder: (BuildContext context, int index){
          return rowProgress(index);
        },
      ),
    );
  }
  Widget rowProgress(int index){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: const Icon(
                IconData(0xe61e, fontFamily: 'MaterialIcons'),
                size: 50,
              ),
              title: Row(
                children: [
                  Text(orders.orders[index].name),
                  Spacer(flex: 5),
                  Text('${orders.orders[index].oid}'),
                  Spacer(flex: 5,),
                  TextButton(
                    child: Text('รับอาหาร'),
                    onPressed: (){
                      ServicesOrder.suc_order(orders.orders[index].oid.toString()).then((_){
                        reloadData();
                      });
                    },
                  ),
                  Spacer(),
                  TextButton(
                    child: Text('ยกเลิก'),
                    onPressed: (){
                      ServicesOrder.can_order(orders.orders[index].oid.toString()).then((_) {
                        reloadData();
                      });
                    },
                  )
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(orders.orders[index].address),
                  Spacer(flex: 5,),
                  Text("ราคา ${orders.orders[index].sumprice} บาท", style: TextStyle(fontSize: 16.0, color: Colors.black),),
                  Spacer(flex: 1,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listSucc(){
    return Expanded(
      child: ListView.builder(
        itemCount: historys.historys == null ? 0 : historys.historys.length,
        itemBuilder: (BuildContext context, int index) {
          return rowSucc(index);
        },
      ),
    );
  }
  Widget rowSucc(int index){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: const Icon(
                IconData(0xe61e, fontFamily: 'MaterialIcons'),
                size: 50,
              ),
              title: Row(
                children: [
                  Text(historys.historys[index].name),
                  Spacer(flex: 5),
                  Text('${historys.historys[index].hid}'),
                  Spacer(flex: 5,),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 5,),
                  Text("ราคา ${historys.historys[index].sumprice} บาท", style: TextStyle(fontSize: 16.0, color: Colors.black),),
                  Spacer(flex: 1,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listCan(){
    return Expanded(
      child: ListView.builder(
        itemCount: historyCan.historyCan == null ? 0 : historyCan.historyCan.length,
        itemBuilder: (BuildContext context, int index){
          return rowCan(index);
        },
      ),
    );
  }
  Widget rowCan(int index){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: const Icon(
                IconData(0xe61e, fontFamily: 'MaterialIcons'),
                size: 50,
              ),
              title: Row(
                children: [
                  Text(historyCan.historyCan[index].name),
                  Spacer(flex: 5),
                  Text('${historyCan.historyCan[index].hid}'),
                  Spacer(flex: 5,),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 5,),
                  Text("ราคา ${historyCan.historyCan[index].sumprice} บาท", style: TextStyle(fontSize: 16.0, color: Colors.black),),
                  Spacer(flex: 1,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: isLoading ? const Center(
        child: CircularProgressIndicator(),
      ):Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'ประวัติคำสั่งซื้อ',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  'กำลังดำเนินการ',
                  style:
                  TextStyle(color: Colors.black), // Set text color to black
                ),
              ),
              Tab(
                child: Text(
                  'เสร็จสิ้น',
                  style:
                  TextStyle(color: Colors.black), // Set text color to black
                ),
              ),
              Tab(
                child: Text(
                  'ยกเลิกคำสั่งซื้อ',
                  style:
                  TextStyle(color: Colors.black), // Set text color to black
                ),
              ),
            ],
          ),
        ),
        body: isLoading ? const Center(
          child: CircularProgressIndicator(),
        ):TabBarView(
          children: <Widget>[
            listProgress(),
            listSucc(),
            listCan(),
          ],
        ),
      ),
    );
  }
}

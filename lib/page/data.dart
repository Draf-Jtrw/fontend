import 'package:flutter/material.dart';
import 'package:testapi/Services_basket.dart';
import 'package:testapi/Services_order.dart';
import 'package:testapi/main.dart';
import 'package:testapi/models/baskets.dart';
import 'package:testapi/models/index.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {

  late Baskets baskets;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baskets = Baskets();
    isLoading = true;

    ServicesBasket.getBasket().then((basketsFromServer){
      setState(() {
        baskets = basketsFromServer;
        isLoading = false;
      });
    });
  }

  void reloeaData() {
    setState(() {
      isLoading = true;
    });

    ServicesBasket.getBasket().then((basketsFromServer){
      setState(() {
        baskets = basketsFromServer;
        isLoading = false;
      });
    });
  }

  Widget list(){
    if (baskets == null) {
      return CircularProgressIndicator();
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: baskets.baskets == null ? 0 : baskets.baskets.length,
          itemBuilder: (BuildContext context, int index) {
            return row(index);
          },
        ),
      );
    }
  }

  Widget row(int index){
    TextEditingController amountController = TextEditingController(text: baskets.baskets[index].amount.toString());
    int currentValue = 0;
    if (baskets.baskets != null && index < baskets.baskets.length) {
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
                leading: Image.network(baskets.baskets[index].pic, width: 100, height: 100,),
                title: Text('${baskets.baskets[index].name}'),
                subtitle: Row(
                  children: [
                    Text('${baskets.baskets[index].price * baskets.baskets[index].amount}'),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: (){
                        ServicesBasket.reData(baskets.baskets[index].fid.toString()).then((_) {
                          reloeaData();
                        });
                        currentValue = int.parse(amountController.text);
                        amountController.text = (currentValue - 1).toString();
                      },
                    ),
                    Spacer(),
                    Expanded(
                        child: Text(amountController.text),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: (){
                        ServicesBasket.pData(baskets.baskets[index].fid.toString()).then((_) {
                          reloeaData();
                        });
                        currentValue = int.parse(amountController.text);
                        amountController.text = (currentValue + 1).toString();
                      },
                    ),
                    Spacer(),
                    Text('ชิ้น'),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตะกร้าสินค้า'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.price_change),
            iconSize: 40,
            onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => MyHomePage(),
              ));
              ServicesOrder.delete_order().then((ordersFromServer) {
                setState(() {

                });
              });
            },
          ),
          Text('    ')
        ],
      ),
      body: Container(
        child: isLoading ? const Center(
          child: CircularProgressIndicator(),
        ) :
        Column(
          children: <Widget>[
            list(),
          ],
        ),
      ),
    );
  }
}

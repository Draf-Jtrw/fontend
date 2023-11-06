import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapi/Services_user.dart';
import 'package:testapi/models/index.dart';

class UserPage extends StatefulWidget {

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  late Users users;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users = Users();
    isLoading = true;

    ServicesUsers.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: isLoading ? const Center(
          child: CircularProgressIndicator(),
        ):
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100,),
              Icon(Icons.people_alt, size: 200, color: Colors.blue,),
              Text('${users.users[0].name}', style: TextStyle(fontSize: 30, color: Colors.red),),
              SizedBox(height: 20,),
              Text('${users.users[0].username}', style: TextStyle(fontSize: 30, color: Colors.red),),
              SizedBox(height: 20,),
              Text('${users.users[0].phone}', style: TextStyle(fontSize: 30, color: Colors.red),),
              SizedBox(height: 20,),
              Text('${users.users[0].address}', style: TextStyle(fontSize: 30, color: Colors.red),),
              SizedBox(height: 20,),
            ],
          ),
          ),
        ),
      );
  }
}

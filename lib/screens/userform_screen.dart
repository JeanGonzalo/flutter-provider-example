import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_example/providers/user_provider.dart';
import 'package:providers_example/screens/detail_screen.dart';

class UserFormScreen extends StatefulWidget {
  static final routeName = "userFormScreen";
  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "name",
                ),
                onChanged: (text) {
                  userProvider.setName(text);
                },
              ),
              TextField(
                controller: _lastnameController,
                decoration: InputDecoration(
                  hintText: "lastname",
                ),
                onChanged: (text) {
                  userProvider.setLastname(text);
                },
              ),
              /*    TextField(
                decoration: InputDecoration(
                  hintText: "age",
                ),
                onChanged: (text) {
                  userProvider.setAge(text);
                },
              ), */
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                color: Colors.black12,
                padding: EdgeInsets.all(10),
                child: Consumer<UserProvider>(builder: (_, provider, widget) {
                  return Text("name => ${provider.name} ${provider.lastname}");
                }),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, DetailScreen.routeName);
                },
                child: Text("Go to detail"),
                color: Colors.blueAccent,
              ),
              SizedBox(
                height: 16,
              ),
              FlatButton(
                onPressed: () {
                  userProvider.logOut();
                  _nameController.text = '';
                  _lastnameController.text = '';
                },
                child: Text("LogOut"),
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

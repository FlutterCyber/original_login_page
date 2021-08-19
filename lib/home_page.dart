import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;

  void doSignIn() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("welcome");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDP"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 70),
              child: Text(
                "Instagram",
                style: TextStyle(fontSize: 40,color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (input) =>
                    !input!.contains("@") ? "Please enter a valid email" : null,
                onSaved: (input) => _email = input!,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                validator: (input) =>
                    input!.length < 6 ? "Must be at least 6 characters" : null,
                onSaved: (input) => _password = input!,
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    doSignIn();
                  },
                  color: Colors.blue,
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 80, top: 30, right: 20),
                    child: Text("Don't have an account?"),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, right: 20),
                    child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

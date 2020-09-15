import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

String username = "";
String password = "";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: "Demo",
      home: MyhomePage(),
      routes: <String, WidgetBuilder>{
        '/secondScreen': (BuildContext context) => new SecondScreen(),
      },
    );
  }
}

class MyhomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("This is a demo"),
      ),
      body: Center(
          child: Container(
        height: 300.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Welcome To Flutter",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )),
            Container(
              child: Flexible(
                child: TextField(
                  onChanged: (text) {
                    username = text;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Flexible(
                child: TextField(
                  onChanged: (text) {
                    password = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: RaisedButton(
                    onPressed: () {
                      bool check = onClickLogin();
                      print(check);
                      if (check == true) {
                        Navigator.of(context).pushNamed('/secondScreen');
                      } else {
                        Fluttertoast.showToast(
                          msg: "Have Wrong!!!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                        );
                      }
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Login', style: TextStyle(fontSize: 27.0)),
                    )))
          ],
        ),
      )),
    );
  }
}

bool onClickLogin() {
  username = username.trim();
  password = password.trim();
  print(username);
  if (username != "" && password != "") {
    if (username == "admin" && password == "admin") {
      return true;
    }
    return false;
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('SecondPage'),
        ),
        body: new Center(child: new Text('Welcome to Flutter admin')));
  }
}

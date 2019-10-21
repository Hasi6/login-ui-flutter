import 'package:flutter/material.dart';
import 'package:login_ui/ui/LoginPage/LoginPage.dart';

class HomaPage extends StatefulWidget {
  @override
  _HomaPageState createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
            ),
            Center(
              child: Image.asset('./images/app_logo.png', width: 150.0,),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: new RaisedButton(
                    color: Colors.blueAccent,
                    child: Text("Login", style: TextStyle(color: Colors.white),),
                    onPressed: ()=>loginBtnClicked(context),
                  ),
                ),
              ),
            ),
          ],
        ), /* add child content here */
      ),
    );
  }
}

loginBtnClicked(context){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}
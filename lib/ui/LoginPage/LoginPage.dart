import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:login_ui/ui/RegisterPage/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();

   String _email = "";
  String _password = "";

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      // _auth.SignIn(_email, _password, context);
      return true;
    }
    return false;
  }

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
              child: Image.asset(
                './images/app_logo.png',
                width: 150.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 100.0),
            ),
            Expanded(
              child: Container(color: Colors.blueAccent,
              width: 420.0,
              height: 100.0,
                child: KeyboardAvoider(
        autoScroll: true,
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: createInputs() + createBtns()),
          ),
        ),
      ),
    )
            )
          ]
        )
      )
    );
      
  }



  List<Widget> createInputs() {
    return [
      SizedBox(
        height: 10.0,
      ),
      Container(
        child: TextFormField(
        decoration: InputDecoration(labelText: 'Email',),
        validator: (value) => value.isEmpty ? 'Email is Required' : null,
        onSaved: (value) => _email = value,
      ),
      ),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'Password is Required' : null,
        onSaved: (value) => _password = value,
      ),
      SizedBox(
        height: 20.0,
      ),
    ];
  }

  List<Widget> createBtns() {
    return [
      RaisedButton(
        shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.white)
),
        child: Text("Login", style: TextStyle(fontSize: 20.0)),
        textColor: Colors.white,
        color: Colors.blue,
        onPressed: () => validateAndSave(),
      ),
      RaisedButton(
        shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.white)
),
        child: Text("Login With Facebook", style: TextStyle(fontSize: 20.0)),
        textColor: Colors.white,
        color: Colors.blue,
        onPressed: () => print("Hasi"),
      ),
      FlatButton(
        child: Text("Don't have an Account? Register Here",
            style: TextStyle(fontSize: 14.0)),
        textColor: Colors.white,
        color: Colors.transparent,
        onPressed: () => loginPageRegisterBtnClicked(context),
      )
    ];
  }

}

loginPageRegisterBtnClicked(context){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => RegisterPage()),
  );
}
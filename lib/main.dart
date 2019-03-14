import 'package:flutter/material.dart';
import 'second.dart';
import 'Biomertic.dart';
import 'package:share/share.dart';
import 'Scan.dart';

void main() => runApp(DD());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment(1.3,-1.0),
              child: RotatedBox(
                quarterTurns: 1,
                //transform: Matrix4.rotationZ(1.5),
                child: Text(
                  "Log In",
                  style: TextStyle(
                      fontSize: 140,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 120, top: 250, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white10)),
                      labelText: "User Name",
                      fillColor: Colors.white,
                      // prefixIcon: Padding(
                      //   padding: EdgeInsets.all(0),
                      //   child: Icon(Icons.person,color: Color.fromRGBO(170, 170, 170, 10),),
                      // )
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white10)),
                      labelText: "Password",
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 450),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Share.share("ahdadhadad");
                     // Navigator.push(context, MaterialPageRoute(builder:(context)=>Next()));
                    },
                    color: Colors.black,
                    elevation: 5.0,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text("Continue")),
                    highlightElevation: 10,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Forget Password ?",style: TextStyle(color: Colors.black,fontSize: 12),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

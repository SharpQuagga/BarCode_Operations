import 'package:flutter/material.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'dart:async';
class Next extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SS(),
    );
  }
}


class SS extends StatefulWidget {
  @override
  _SSState createState() => _SSState();
}

class _SSState extends State<SS> {
  String imei="asd";

  @override
   initState() {
    super.initState();
    new Future.delayed(
      Duration(seconds: 1),
    ()=>ab(),
    );
  }  

  Future<void> ab() async {
    imei = await ImeiPlugin.getImei;  
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      body:SingleChildScrollView(
              child: Stack(
          children: <Widget>[
            Container(
              color: Color.fromRGBO(239, 95, 117, 10),
              padding: EdgeInsets.only(top: 320,left: 10,right: 10),
              child: Column(
                children: <Widget>[
                  Text("Welcome",style: TextStyle(color:Color.fromRGBO(255, 244, 246, 10),fontSize: 30,),),
                  SizedBox(height: 10,),
                  Text("Sign in to access your account",style: TextStyle(color: Colors.white54,fontSize: 16),),
                   SizedBox(height: 15,),
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 1.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.white, width: 1.0),
                         ),
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Email ID",
                      hintText: "Enter your Mail ID",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 1.0),
                      ),
                      enabledBorder: const OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.white, width: 1.0),
                         ),
                       labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Password",
                      hintText: "Enter your Password",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 150,)
                ],
              ),
            ),
            ClipPath(
              child: Image(
                  image: AssetImage("assets/white.png"),
                ),
              clipper: MyClipper(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 120,vertical: 100),
                        child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(239, 95, 117, 10),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Image(
                      image: AssetImage("assets/Whouse.png"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = new Path();
    
    path.lineTo(0.0, size.height-30);
    
      var firstControlPoint = Offset(size.width / 3.70, size.height-120);
   var firstEndPoint = Offset(size.width / 2.25, size.height - 60);
   path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
       firstEndPoint.dx, firstEndPoint.dy);

   var secondControlPoint =
       Offset(size.width - (size.width / 2.35), size.height - 25);
   var secondEndPoint = Offset(size.width/1.40, size.height - 60);
   path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
       secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint =
    Offset(size.width/1.10, size.height-110);
    var thirdEndPoint = Offset(size.width, size.height-70);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);

   path.lineTo(size.width, size.height-70);
   path.lineTo(size.width, 0.0);



     path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
  
}
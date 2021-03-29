import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '南京亚青会',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  AnimationController _rotateController;
  Animation _rotateAnimation;


  @override
  void initState() {
    super.initState();
    _rotateController = AnimationController(duration: Duration(milliseconds: 4000), vsync: this);
    _rotateAnimation = Tween(begin: 0.0, end: 2 * pi).animate(_rotateController)
    ..addListener((){
      setState(() {
        //print("update ${_rotateAnimation.value}");
      });
    });
    _rotateController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Container(
          width: 800,
          color: Colors.blue,
          child: Stack(
            children: [
              Container(
                child: Image.asset("images/welcome_bg.png" ,fit: BoxFit.fitWidth,width: double.infinity,),
              ),

              Align(
               alignment: FractionalOffset(0.5 , 0.2),
                child: Transform.rotate(
                  angle:_rotateAnimation.value,
                  child: Image.asset("images/welcome_light.png"),
                ),
              ),

              Align(
                alignment: FractionalOffset(0.5 , 1.0),
                child: Image.asset("images/welcome_bottom.png" , fit: BoxFit.fitWidth,width: double.infinity),
              ),

              Center(
                child: Image.asset("images/welcome_monkey.png" , fit: BoxFit.fitWidth),
              )
            ],
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    if(_rotateController != null){
      _rotateController.dispose();
    }
    super.dispose();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _text = "Pode Entrar!";

  void _changePeople(int i){
    setState(() {
      _people+=i;
      if(_people<0){
        _text = "Mundo Invertido!";
      }else if(_people<=10){
        _text = "Pode entrar!";
      }else{
        _text = "Lotado!";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pessoas: $_people",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                    onPressed: () {
                      _changePeople(1);
                    },
                    child: Text("+1",
                        style: TextStyle(color: Colors.white, fontSize: 40.0))),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                    onPressed: () {
                      _changePeople(-1);
                    },
                    child: Text("-1",
                        style: TextStyle(color: Colors.white, fontSize: 40.0))),
              ),
            ]),
            Text("$_text",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0,
                ))
          ],
        )
      ],
    );
  }
}

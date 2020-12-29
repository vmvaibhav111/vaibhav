import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  String output="0";
  String _output ="0";
  double num1 =0.0;
  double num2 =0.0;
  String operand ="";

    buttonPressed(String buttonText)
    {
      if(buttonText =="Clear"){
       
       _output ="0";
      num1 =0.0;
      num2 =0.0;
      operand ="";
    }else if ( buttonText == "+" || buttonText == "-"|| buttonText == "*" || buttonText == "/" )
    {
      num1 = double.parse(output);
      operand = buttonText;
      _output ="0";

    }else {
      if (buttonText == "."){

      if(_output.contains(".")){
        print("already contains decimal");
        return;
      }else {
        _output = _output + buttonText;
      }
    }else if(buttonText =="="){
      num2 = double.parse(output);
      
      if(operand == "+"){
        _output=(num1+num2).toString();
      }
      if(operand == "-"){
        _output=(num1-num2).toString();
      }
      if(operand == "*"){
        _output=(num1*num2).toString();
      }
      if(operand == "/"){
        _output=(num1/num2).toString();
      }

      num1=0.0;
      num2=0.0;
      operand="";
    }else {
      _output = _output + buttonText;
    }
    }
    print(output);
    setState((){
      output = double.parse(_output).toStringAsFixed(2);
    }
    
    );
    }
 
 
  Widget buildButton(String buttonText){
   return new Expanded(
     child: new OutlineButton(
       padding: new EdgeInsets.all(40),
      child: new Text(buttonText,
         style: TextStyle(fontSize: 25, 
            fontWeight: FontWeight.bold,
            ),
            ),
           onPressed: ()=> { buttonPressed(buttonText) },
            ),
            );        
        }              
      
        @override
        Widget build(BuildContext context) {
          var child;
              return new Scaffold(
                appBar: new AppBar(
                  title: new Text(widget.title),
                ),
                body:new Container(
                  child: new Column(children: <Widget>[
                  new Container(
                    alignment: Alignment.centerRight,
                    padding: new EdgeInsets.symmetric(vertical:50,horizontal:10),
                  child: new Text(output, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, )),),
          
                  new Expanded(child: new Divider(),
                  ),
                   new Column(
                      children: [
                        new Row(
                          children: [
                            buildButton("7"),
                            buildButton("8"),
                            buildButton("9"),
                            buildButton("/"),
                           ]
                        ),
      
                         new Row(
                          children: [
                            buildButton("4"),
                            buildButton("5"),
                            buildButton("6"),
                            buildButton("*"),
                           ]
                        ),
      
                         new Row(
                          children: [
                            buildButton("1"),
                            buildButton("2"),
                            buildButton("3"),
                            buildButton("-"),
                           ]
                        ),
                         new Row(
                          children: [
                            buildButton("."),
                            buildButton("0"),
                            buildButton("00"),
                            buildButton("+"),
                           ]
                        ),
      
                         new Row(
                          children: [
                            buildButton("Clear"),
                            buildButton("="),
                           ]
                        ),
                      ],
                    ),   
              
            
              ],)
          )
        
          );
        }
      }

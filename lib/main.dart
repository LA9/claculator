
import 'package:calculator/colors/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorAppHome(),
    );
  }
}

class CalculatorAppHome extends StatefulWidget {
  const CalculatorAppHome({super.key});

  @override
  State<CalculatorAppHome> createState() => _CalculatorAppHomeState();
}

class _CalculatorAppHomeState extends State<CalculatorAppHome> {

  String equation = "0";
  String result = "4";
  String expression = "";

  buttonPressed(btnText){

setState(() {
      if (btnText == "AC") {
      equation = "0";
      result = "0";
    }else if(btnText == "⌫"){
      equation = equation.substring(0,equation.length-1);
      if(equation == ""){
        equation = "0";
      }
    }else if(btnText == "="){

expression = equation;
expression = expression.replaceAll("x", "*");
expression = expression.replaceAll("÷", "/");
print(expression);

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          result = '${exp.evaluate(EvaluationType.REAL, ContextModel())}';
        } catch (e) {
          "Error";
        }

    }else{
      if(equation == "0"){
        equation = btnText;
      }else{
        equation = equation + btnText;
      }
    }
});

    
  }

  Widget calButton(String btnText,Color textColor,double btnWidth, Color btnColor){
    return  InkWell(
      onTap:(){
        buttonPressed(btnText);

      },
      child: Container(
          alignment: Alignment.center,
          height:50,
          width:btnWidth,
          decoration:BoxDecoration(
            color: btnColor,
            borderRadius:BorderRadius.circular(50)
          ),
          child:Text(btnText,style:TextStyle(color:textColor , fontSize:30))
         ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 82, 82, 82),
      appBar: AppBar(
        title: Text("Calculator" ,style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 21, 53, 110),
      ),

     body:Column(
       children: [
          SizedBox(height:10),

       Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height:60,
        width:double.infinity,
        color:const Color.fromARGB(255, 129, 129, 129),
        child:SingleChildScrollView(child:Text(equation,style:TextStyle(color:Colors.white , fontSize:30)))
       ),
          SizedBox(height:10),

       Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height:60,
        width:double.infinity,
        color:const Color.fromARGB(255, 129, 129, 129),
        child:Text(result,style:TextStyle(color:Colors.white , fontSize:30))
       ),

Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    children: [
      Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          calButton("AC", Colors.white, 60, CustomColors.ornage),
          calButton("⌫", Colors.white, 60, Colors.lightBlue),
          calButton("%", Colors.white, 60, Colors.lightBlue),
          calButton("÷", Colors.white, 60, Colors.lightBlue),
      
        ]
      ),
    SizedBox(height:20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          calButton("7", Colors.white, 60, Colors.deepOrangeAccent),
          calButton("8", Colors.white, 60, CustomColors.ornage),
          calButton("9", Colors.white, 60, CustomColors.ornage),
          calButton("x", Colors.white, 60, Colors.lightBlue),
        ]
      ),
      SizedBox(height:20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          calButton("4", Colors.white, 60, CustomColors.ornage),
          calButton("5", Colors.white, 60, CustomColors.ornage),
          calButton("6", Colors.white, 60, CustomColors.ornage),
          calButton("-", Colors.white, 60, Colors.lightBlue),
        ]
      ),
      SizedBox(height:20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          calButton("1", Colors.white, 60, CustomColors.ornage),
          calButton("2", Colors.white, 60, CustomColors.ornage),
          calButton("3", Colors.white, 60, CustomColors.ornage),
          calButton("+", Colors.white, 60, Colors.lightBlue),
        ]
      ),
      SizedBox(height:20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          calButton("0", Colors.white, 60, CustomColors.ornage),
          calButton(".", Colors.white, 60, CustomColors.ornage),
          calButton("00", Colors.white, 60, CustomColors.ornage),
          calButton("=", Colors.white, 60, Colors.lightBlue),
        ]
      ),
    
    ],
  ),
)
       ]
     ),
     

      );
}
}
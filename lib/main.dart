
import 'package:calculator/constants.dart';
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
  String result = "0";
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
        final isOperator = btnText[0] == "x" || btnText[0] == "÷" || btnText[0] == "/" || btnText[0] == "-" || btnText[0] == "+" || btnText[0] == "x";
final isEqualToFirst = btnText == btnText[0];

        if(isEqualToFirst && isOperator){
  RegExp regex = RegExp(r'(\d+)\s*[\+\-\*\/]\s*(\d+)$');
   if(regex.hasMatch(btnText)){
        equation = "$equation$btnText";

   }else{
        equation = "$equation $btnText ";
   }
        }else{
        equation = equation + btnText;

        }

      }
    }
});

    
  }

  Widget calButton(String btnText,Color textColor,double textFontSize){
    return  InkWell(
      onTap:(){
        buttonPressed(btnText);

      },
      child: Container(
          alignment: Alignment.center,
          height:65,
          width:65,
          decoration:BoxDecoration(
            color: const Color.fromARGB(66, 22, 22, 22),
            borderRadius:BorderRadius.circular(10)
          ),
          child:Text(btnText,style:TextStyle(color:textColor , fontSize:textFontSize , fontWeight: FontWeight.w600))
         ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:appBackgroundColor,
      appBar: AppBar(
        backgroundColor: appBackgroundColor,
      ),

     body:Column(
       children: [
          SizedBox(height:40),

       Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height:40,
        width:double.infinity,
        color:appBackgroundColor,
        child:SingleChildScrollView(child:Text(equation,style:TextStyle(color:Colors.white , fontSize:30, fontWeight: FontWeight.bold)))
       ),

       Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height:80,
        width:double.infinity,
        color:appBackgroundColor,
        child:Text(result,style:TextStyle(color:Colors.white , fontSize:70 , fontWeight: FontWeight.bold))
    ,
       
       ),
    SizedBox(height:37),

Container(
        //create radius border
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 37, 37, 37),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
            ),
        ),
  padding: const EdgeInsets.all(35.0),
  child: Column(
    children: [
      Row(

        spacing: spacingBetweenButtonsInRows,

        children: [
          calButton("AC", Colors.lightGreenAccent,btnOperatorFontSize),
          calButton("⌫", Colors.lightGreenAccent,btnOperatorFontSize),
          calButton("%", Colors.lightGreenAccent,btnOperatorFontSize),
          calButton("÷", Colors.redAccent,btnOperatorFontSize),
      
        ]
      ),
    SizedBox(height:spacingBetweenButtonsInColumn),
      Row(
         spacing: spacingBetweenButtonsInRows,
        children: [
          calButton("7", btnNumbersColor,btnNumbersFontSize),
          calButton("8", btnNumbersColor,btnNumbersFontSize),
          calButton("9", btnNumbersColor,btnNumbersFontSize),
          calButton("x", Colors.redAccent,btnOperatorFontSize),
        ]
      ),
      SizedBox(height:spacingBetweenButtonsInColumn),
      Row(
         spacing: spacingBetweenButtonsInRows,
        children: [
          calButton("4", btnNumbersColor,btnNumbersFontSize),
          calButton("5", btnNumbersColor,btnNumbersFontSize),
          calButton("6", btnNumbersColor,btnNumbersFontSize),
          calButton("-", Colors.redAccent,btnOperatorFontSize),
        ]
      ),
      SizedBox(height:spacingBetweenButtonsInColumn),
      Row(
         spacing: spacingBetweenButtonsInRows,
        children: [
          calButton("1", btnNumbersColor,btnNumbersFontSize),
          calButton("2", btnNumbersColor,btnNumbersFontSize),
          calButton("3", btnNumbersColor,btnNumbersFontSize),
          calButton("+", Colors.redAccent,btnOperatorFontSize),
        ]
      ),
      SizedBox(height:spacingBetweenButtonsInColumn),
      Row(
         spacing: spacingBetweenButtonsInRows,
        children: [
          calButton("0", btnNumbersColor,btnNumbersFontSize),
          calButton(".", btnNumbersColor,btnNumbersFontSize),
          calButton("00", btnNumbersColor,btnNumbersFontSize),
          calButton("=", Colors.redAccent,btnOperatorFontSize),
        ]
      ),
      SizedBox(height:10),
    
    ],

  ),
)
       ]
     ),
     

      );
}
}
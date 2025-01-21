import 'package:calculator/colors/CustomColors.dart';
import 'package:flutter/material.dart';

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

  Widget calButtons(){
    return  Container(
        alignment: Alignment.center,
        height:50,
        width:50,
        decoration:BoxDecoration(
          color:CustomColors.ornage,
          borderRadius:BorderRadius.circular(50)
        ),
        child:Text("AC",style:TextStyle(color:Colors.white , fontSize:30))
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
        child:Text("0",style:TextStyle(color:Colors.white , fontSize:30))
       ),
          SizedBox(height:10),

       Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height:60,
        width:double.infinity,
        color:const Color.fromARGB(255, 129, 129, 129),
        child:Text("0",style:TextStyle(color:Colors.white , fontSize:30))
       ),

Row(
  children: [
 

  ]
)
       ]
     ),
     

      );
}
}
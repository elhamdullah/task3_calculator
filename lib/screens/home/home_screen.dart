import 'package:calculator/constant/constant_screen.dart';
import 'package:flutter/material.dart';
import 'backspace_screen.dart';
import 'custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String textbtn="";
  String history="";

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          /////////////////////////////////////////////////result container
          Container(
            padding: EdgeInsets.all(mediaquery.width*0.02),
            decoration: BoxDecoration(
           //   color: Colors.black,
              borderRadius: BorderRadius.circular(20)
            ),
            height: mediaquery.height*0.4,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(history,style: TextStyle(color: constantScreen.buttonColor,fontSize: mediaquery.width*0.1),textAlign: TextAlign.end,),
                SingleChildScrollView(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Row(
                    children: [
                      Text(textbtn,style: TextStyle(color: Colors.white,fontSize: mediaquery.width*0.15),),
                    ],
                  ),
                ),
              ],
            ),
          ),


          /////////////////////////////////////////////////buttons numbers and operations
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    ButtonScreen(text: 'C',onBTNClick: clearButtonClick,BTnColor: constantScreen.buttonColor,),
                    ButtonScreen(text: '+/-',onBTNClick: onPositiveNegativeClick,BTnColor: constantScreen.buttonColor,),
                    ButtonScreen(text: '%',onBTNClick: onOperationClicked,BTnColor: constantScreen.buttonColor,),
                    ButtonScreen(text: '÷',onBTNClick: onOperationClicked,BTnColor: constantScreen.buttonOPColor,),
                  ],
                ),
                Row(
                  children: [
                    ButtonScreen(text: '7',onBTNClick: onDigitClick,BTnColor: constantScreen.textBTnColor,),
                    ButtonScreen(text: '8',onBTNClick: onDigitClick,BTnColor: constantScreen.textBTnColor,),
                    ButtonScreen(text: '9',onBTNClick: onDigitClick,BTnColor: constantScreen.textBTnColor,),
                    ButtonScreen(text: 'x',onBTNClick: onOperationClicked,BTnColor: constantScreen.buttonOPColor,),
                  ],
                ),
                Row(
                  children: [
                    ButtonScreen(text: '4',onBTNClick: onDigitClick,BTnColor: constantScreen.textBTnColor,),
                    ButtonScreen(text: '5',onBTNClick: onDigitClick,BTnColor: constantScreen.textBTnColor,),
                    ButtonScreen(text: '6',onBTNClick: onDigitClick,BTnColor: constantScreen.textBTnColor,),
                    ButtonScreen(text: '-',onBTNClick: onOperationClicked,BTnColor: constantScreen.buttonOPColor,),
                  ],
                ),
                Row(
                  children: [
                    ButtonScreen(text: '1',onBTNClick: onDigitClick,BTnColor: constantScreen.textBTnColor,),
                    ButtonScreen(text: '2',onBTNClick: onDigitClick,BTnColor: constantScreen.textBTnColor,),
                    ButtonScreen(text: '3',onBTNClick: onDigitClick,BTnColor: constantScreen.textBTnColor,),
                    ButtonScreen(text: '+',onBTNClick: onOperationClicked,BTnColor: constantScreen.buttonOPColor,),
                  ],
                ),
                Row(
                  children: [
                    ButtonScreen(text: '.',onBTNClick: onDotClick,BTnColor: constantScreen.textBTnColor,),
                    ButtonScreen(text: '0',onBTNClick: onDigitClick,BTnColor: constantScreen.textBTnColor,),
                    BackspaceScreen(text: "",onBTNClick: backSpace,BTnColor: constantScreen.textBTnColor),
                    ButtonScreen(text: '=',onBTNClick: onEqualClick,BTnColor: constantScreen.buttonOPColor,),
                  ],
                ),


              ],
            ),
          ),
        ],
      ),

    );
  }
  ////////////////////////method for number button
  void onDigitClick (String str){
    textbtn+=str;
    setState(() {});
  }

  ////////////////////////method for clear button
void clearButtonClick(String str){
    textbtn="";
    history="";
    setState(() {});
}

///////////////////////////method for backspace button
void backSpace(String str) {
  textbtn = textbtn.substring(0, textbtn.length - 1);
  setState(() {});
}

///////////////////////////method for operation button
 String calculate(String lhs,String op,String rhs){
    double num1=double.parse(lhs);
    double num2=double.parse(rhs);

    double res=0.0;
    switch (op) {
      case "+":
        res = num1 + num2;
        break;
      case "-":
        res = num1 - num2;
        break;
      case "x":
        res = num1 * num2;
        break;
      case "÷":
        res=num1/num2;
        break;
      case "%":
        res = num1 % num2;
        break;
    }
    return res.toString();
 }

 String savedNumber="";
  String savedOperation="";

  void onOperationClicked(String btnClick){
    if (savedNumber.isEmpty){
      savedNumber=textbtn;
      savedOperation=btnClick;
      textbtn="";
      setState(() {});
    }else{
      String newNumber=textbtn;
      var res=calculate(savedNumber,savedOperation,newNumber);
      savedNumber=res;
      savedOperation=btnClick;
      textbtn="";
      setState(() {});
    }
  }


  ////////////////////////////////////////////method for equal button
  onEqualClick(String btnText){
    String newNumber=textbtn;
    var result= calculate(savedNumber,savedOperation,newNumber);
    textbtn=result;
    history+='${double.parse(savedNumber)} $savedOperation ${double.parse(newNumber)}';
    savedNumber="";
    savedOperation=btnText;
    setState(() {

    });
  }

  //////////////////////////////////////method form positive to negative button
  void onPositiveNegativeClick(String btnText){
    double num = double.parse(textbtn);
    num = num * -1;
    textbtn = num.toString();
    setState(() {});
  }


  ////////////////////////////////////method dot button
  void onDotClick(String btnText){
    if (textbtn.contains(".")){
      return;
    }
    textbtn+=btnText;
    setState(() {});
  }
}

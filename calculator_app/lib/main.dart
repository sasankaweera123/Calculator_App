import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Icon(
          Icons.calculate_outlined,
          color: Colors.white,
          size: 150,
        ),
        duration: 3000,
        nextScreen: Calculator(),
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        backgroundColor: Colors.black,
      ),

    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(onPressed: () {
        //TODO add Function for Button pressed
        calculation(btntxt);
        },
        child: Text(btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(20.0),
       ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Calculator display
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 100),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Buttons and Functions
                calcbutton('AC', Colors.blueAccent, Colors.black),
                calcbutton('+/-', Colors.blueAccent, Colors.black),
                calcbutton('%', Colors.blueAccent, Colors.black),
                calcbutton('/', Colors.green, Colors.white),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Buttons and Functions
                calcbutton('7', Colors.indigo, Colors.white),
                calcbutton('8', Colors.indigo, Colors.white),
                calcbutton('9', Colors.indigo, Colors.white),
                calcbutton('x', Colors.green, Colors.white),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Buttons and Functions
                calcbutton('4', Colors.indigo, Colors.white),
                calcbutton('5', Colors.indigo, Colors.white),
                calcbutton('6', Colors.indigo, Colors.white),
                calcbutton('-', Colors.green, Colors.white),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Buttons and Functions
                calcbutton('1', Colors.indigo, Colors.white),
                calcbutton('2', Colors.indigo, Colors.white),
                calcbutton('3', Colors.indigo, Colors.white),
                calcbutton('+', Colors.green, Colors.white),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Button 0
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                  onPressed: (){
                    //buttonFunction
                    calculation('0');
                  },
                  shape: StadiumBorder(),
                  child: Text('0',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.indigo,
                ),
                //Other two buttons
                calcbutton('.', Colors.indigo, Colors.white),
                calcbutton('=', Colors.green, Colors.white),
              ],
              
            ),
          ],
        ),
      ),
    );
  }


//Logic
dynamic text ='0';
double numOne = 0;
double numTwo = 0;

dynamic result = '';
dynamic finalResult = '';
dynamic opr = '';
dynamic preOpr = '';
void calculation(btnText) {


  if(btnText  == 'AC') {
    text ='0';
    numOne = 0;
    numTwo = 0;
    result = '';
    finalResult = '0';
    opr = '';
    preOpr = '';

  } else if( opr == '=' && btnText == '=') {

    if(preOpr == '+') {
      finalResult = add();
    } else if( preOpr == '-') {
      finalResult = sub();
    } else if( preOpr == 'x') {
      finalResult = mul();
    } else if( preOpr == '/') {
      finalResult = div();
    }

  } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

    if(numOne == 0) {
      numOne = double.parse(result);
    } else {
      numTwo = double.parse(result);
    }

    if(opr == '+') {
      finalResult = add();
    } else if( opr == '-') {
      finalResult = sub();
    } else if( opr == 'x') {
      finalResult = mul();
    } else if( opr == '/') {
      finalResult = div();
    }
    preOpr = opr;
    opr = btnText;
    result = '';
  }
  else if(btnText == '%') {
    result = numOne / 100;
    finalResult = doesContainDecimal(result);
  } else if(btnText == '.') {
    if(!result.toString().contains('.')) {
      result = result.toString()+'.';
    }
    finalResult = result;
  }

  else if(btnText == '+/-') {
    result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
    finalResult = result;

  }

  else {
    result = result + btnText;
    finalResult = result;
  }


  setState(() {
    text = finalResult;
  });

}


String add() {
  result = (numOne + numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String sub() {
  result = (numOne - numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}
String mul() {
  result = (numOne * numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}
String div() {
  result = (numOne / numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}


String doesContainDecimal(dynamic result) {

  if(result.toString().contains('.')) {
    List<String> splitDecimal = result.toString().split('.');
    if(!(int.parse(splitDecimal[1]) > 0))
      return result = splitDecimal[0].toString();
  }
  return result;
}

}

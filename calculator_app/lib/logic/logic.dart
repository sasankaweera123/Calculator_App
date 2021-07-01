/*
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
*/

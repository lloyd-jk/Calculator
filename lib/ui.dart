import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_cal/utilities.dart';
import 'dart:math';

class Cal_UI extends StatefulWidget {
  @override
  _Cal_UIState createState() => _Cal_UIState();
}

class _Cal_UIState extends State<Cal_UI> {
  String output = '0';
  String disp_2 = '';
  String disp_1 = '';
  String temp = '';
  String stack = '';
  var _output = '';
  var tmp;
  var flag = 0;
  double a = 0.0;
  double b = 0.0;
  String operand = '';
  button_pressed(String buttonText) {
    if (buttonText == 'x²') buttonText = 'sqrt';
    // if (buttonText == '÷') buttonText = '/';
    temp = '';
    if (flag == 1) {
      _output = '0';
      a = 0.0;
      b = 0.0;
      operand = '';
      disp_1 = '';
      disp_2 = '';
      flag = 0;
    }
    if (buttonText == '%') {
      _output = (double.parse(output) / 100).toString();
      a = 0.0;
      b = 0.0;
      operand = '';
      disp_1 = '';
    } 
    if(buttonText=='C'){
      _output='0.0';
    }
    else if (buttonText == 'sqrt') {
      tmp = pow(double.parse(output), 2);
      print('tmp $tmp');
      _output = tmp.toString();
    } else if (buttonText == 'AC') {
      _output = '0';
      a = 0.0;
      b = 0.0;
      operand = '';
      disp_1 = '';
      disp_2 = '';
      flag = 0;
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '÷') {
      stack += buttonText;
      if (output == '0.0') {
        print("pass");
      } else if (a != 0.0) {
        print('a changes from $a');
        if (operand == '+') a = (a + double.parse(output));
        if (operand == '-') a = (a - double.parse(output));
        if (operand == 'x') a = (a * double.parse(output));
        if (operand == '÷') a = (a / double.parse(output));
        print("to this $a");
      } else {
        a = double.parse(output);
      }
      operand = buttonText;
      print("a $a b $b operand $operand");
      _output = '0';
    } else if (buttonText == '.') {
      if (!(_output.contains('.'))) {
        _output = _output + buttonText;
      }
    } else if (buttonText == '=') {
      flag = 1;
      b = double.parse(_output);
      if (operand == '+') _output = (a + b).toString();
      if (operand == '-') _output = (a - b).toString();
      if (operand == 'x') _output = (a * b).toString();
      if (operand == '÷') _output = (a / b).toString();
      a = 0.0;
      b = 0.0;
      operand = '';
    } else {
      _output = _output + buttonText;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(1);
      if(double.parse(output)%1==0){
        output='';
        print("here?");
        output=double.parse(_output).toStringAsFixed(0);
      }
      // if(buttonText=='sqrt'){
      // disp_1+=output+'^2';
      // }
      // else
      // {
      if (flag == 1) {
        disp_2 = '=' + output;
        // print(string1[-1]);
        if (disp_1.endsWith('+') ||
            disp_1.endsWith('÷') ||
            disp_1.endsWith('.') ||
            disp_1.endsWith('-') ||
            disp_1.endsWith('x')) {
          temp = disp_1.substring(0, disp_1.length - 1);
          disp_1 = '';
          disp_1 = temp;
        }
        // else{finals=string;}
      }
      if (buttonText == '%') {
        disp_2 = _output;
      } 
      if(buttonText=='C'){
        temp=disp_1;
        var i=1;
        while(temp.endsWith('+')||temp.endsWith('÷')||temp.endsWith('x')||temp.endsWith('-')){
        // print("here");
          temp='';
          temp=disp_1.substring(0,temp.length-i); 
          print('temp $temp');
          i+=1;
        }
        disp_1='';
        disp_1=temp;
      }
      else if (buttonText != 'AC' && buttonText != '=') {
        if (disp_1.endsWith('+') ||
            disp_1.endsWith('÷') ||
            disp_1.endsWith('.') ||
            disp_1.endsWith('-') ||
            disp_1.endsWith('x')) {
          if (buttonText == '+' ||
              buttonText == '-' ||
              buttonText == '/' ||
              buttonText == 'x' ||
              buttonText == '.') {
            // print('operan $operand button $buttonText' );
            if (buttonText != stack[stack.length - 2]) {
              temp = disp_1.substring(0, disp_1.length - 1) + operand;
              disp_1 = '';
              disp_1 = temp;
            }
          } else {
            disp_1 += buttonText;
            // finals=string;
          }
        } else if (buttonText == 'sqrt') {
          disp_1 += '^2';
        } else {
          disp_1 += buttonText;
          // finals=string;
        }
      }
      // }
    });
  }

  Widget button(String buttonText) {
    return RaisedButton(
        onPressed: () => button_pressed(buttonText),
        child: Text(
          buttonText,
          style: GoogleFonts.montserrat(fontSize: 20),
        ),
      );
  }

  Container row(String a, String b, String c, String d) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        button(a),
        button(b),
        button(c),
        button(d),
      ],
    ));
  }

  Container row_special(String a, String b, String c) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          button(a),
          button(b),
          button(c),
        ],
      ),
    );
  }

  Container buttons() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          row('AC', 'x²', '%', '÷'),
          row('7', '8', '9', 'x'),
          row('4', '5', '6', '-'),
          row('1', '2', '3', '+'),
          row_special('0', '.', '='),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: SafeArea(
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Spacer(flex:1),
                display0(),
                Spacer(),
                display1(disp_1),
                display2(disp_2),
                // Spacer(flex: 1),
                buttons(),
                // Spacer(flex: 1,),
              ],
            ),
          ),
        ));
  }
}

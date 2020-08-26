import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container display0() {
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          'Calculator',
          style: GoogleFonts.poppins(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
    ],
  ));
}

Container display1(String live) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Text(
        live,
        style: GoogleFonts.montserrat(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.w200),
    ),
      ),
    ],)
    
  );
}

Container display2(String output) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(output,
          style: GoogleFonts.montserrat(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.w100)),
        ),
      ],
    ),
  );
}

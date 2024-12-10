import 'package:flutter/material.dart';

Widget glowingBtn(
    {required String title, required VoidCallback onTap, double padding = 10}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      // margin: const EdgeInsets.all(10),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
          )
        ],
        color: const Color.fromARGB(255, 54, 111, 33),
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: const Color.fromARGB(255, 66, 212, 26), width: 2),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

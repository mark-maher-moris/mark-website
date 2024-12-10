import 'package:flutter/material.dart';

Widget contactMeWidget(
    {required VoidCallback onTap,
    required String value,
    required IconData icon}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
            ),
            SizedBox(
              width: 20,
            ),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ),
  );
}

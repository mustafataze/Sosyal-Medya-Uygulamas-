import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Follow extends StatelessWidget {
  final Function()? function;
  final Color borderColor;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  const Follow({super.key, this.function, required this.borderColor, required this.text, required this.textColor, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2),
      child: TextButton(
        onPressed: function,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          width: 250,
          height: 27,
        ),
      ),
    );
  }
}

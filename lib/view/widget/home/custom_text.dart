

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  const CustomText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: const Text(
        'New Playing',
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black45
        ),
      ),
    );
  }
}

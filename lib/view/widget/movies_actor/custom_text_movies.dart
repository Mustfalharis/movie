

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomTextMovies extends StatelessWidget {
  const CustomTextMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'Movies',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }
}

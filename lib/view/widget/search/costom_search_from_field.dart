

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchFromField extends StatelessWidget {
  final TextEditingController myController;
  final ValueChanged<String>? onChanged;
  const CustomSearchFromField({Key? key, required this.myController, required this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
       controller: myController,
        onChanged: onChanged,
       decoration: InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.red,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        hintText: "Search Movies",
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/details_items_controller.dart';
class CustomDescription extends GetView<DetailsControllerImp> {
  const CustomDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height:80,
      child: Text(
        controller.movieModel!.moiveDes!,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black
        ),
      ),
    );
  }
}

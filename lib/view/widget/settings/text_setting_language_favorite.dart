
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/class/check_user.dart';
import 'package:get/get.dart';
import 'package:movies_app/core/constant/routes.dart';
class TextSettingLanguageAndFavorite extends StatelessWidget {
  const TextSettingLanguageAndFavorite({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text(
            'Settings',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: const [
                  Icon(Icons.language),
                  SizedBox(width: 8,),
                  Text('Language'),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),

        ],
      ),
    );
  }
}

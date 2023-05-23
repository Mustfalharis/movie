

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/core/constant/routes.dart';
class DetailsMyAccount extends StatelessWidget {
  const DetailsMyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const SizedBox(height: 30,),
          const Text(
            'My Account',
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
                  Icon(Icons.person_outline),
                  SizedBox(width: 8,),
                  Text('Account Information'),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: (){
              Get.toNamed(AppRoute.favorite);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: const [
                    Icon(Icons.favorite_outline),
                    SizedBox(width: 8,),
                    Text('Wishlist'),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

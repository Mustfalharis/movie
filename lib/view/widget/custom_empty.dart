
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomEmpty extends StatelessWidget {
  final String title;
  final IconData iconData;
  const CustomEmpty({Key? key, required this.title, required this.iconData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/4),
      child: Center(
        child:Column(
        children:  [
          Icon(iconData,size: 90,),
          const SizedBox(height: 5,),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),),
    );
    // Your recent searches will show up here
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomButtonAppBar extends StatelessWidget {
  final VoidCallback onPressed;
  final String textButton;
  final IconData iconData;
  final bool? active;
  const  CustomButtonAppBar({super.key, required this.onPressed, required this.textButton, required this.iconData,required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding:active==true? const EdgeInsets.only(right: 17,top: 5,bottom: 5,left: 5):null,
            decoration: active==true? BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(20)
              ):null,
            child:Row(
              children: [
                Icon(
                  iconData,
                  color: Colors.white,
                  size: 30,
                ),
             const SizedBox(width: 5,),
             active==true?
                 Container(
                  child: Text(
                    textButton,
                    style: const TextStyle(
                      color: Colors.white,
                    ),),
                ):
                 const SizedBox(),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
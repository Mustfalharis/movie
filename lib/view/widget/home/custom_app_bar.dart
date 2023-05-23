
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget {

  const CustomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(
        Icons.menu,
        color: Colors.black45,
      ),
      title: Text(
        'Movies-db'.toUpperCase(),
        style: Theme.of(context).textTheme.caption!.copyWith(
          color: Colors.black45,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 25, top: 5),
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.jpg'),
          ),
        ),
      ],
    );
  }
}

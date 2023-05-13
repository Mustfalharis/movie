

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomImage extends StatelessWidget {
  final String title;
  const BottomImage({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10,left: 10),
      alignment: Alignment.topLeft,
      child:  Text(
        title.toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .caption!
            .copyWith(
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

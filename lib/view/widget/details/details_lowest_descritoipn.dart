

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/details_items_controller.dart';
class DetailsLowestDescription extends GetView<DetailsControllerImp>  {
  const DetailsLowestDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Release date'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'muli',
                ),
              ),
              Text(
                controller.movieModel!.moiveCreate!.toString(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(
                  color: Colors.yellow[800],
                  fontSize: 12,
                  fontFamily: 'muli',
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'rating'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'muli',
                ),
              ),
              Text(
                '    ${controller.movieModel!.moiveRating!}',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(
                  color: Colors.yellow[800],
                  fontSize: 14,
                  fontFamily: 'muli',
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Producer'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'muli',
                ),
              ),
              Text(
                controller.movieModel!.moiveProducer!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(
                  color: Colors.yellow[800],
                  fontSize: 14,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

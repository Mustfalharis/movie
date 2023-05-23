
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/favorite_controller.dart';
import 'package:movies_app/controller/home_controller.dart';
import 'package:movies_app/core/class/hindling_data_view.dart';
import 'package:movies_app/link_api.dart';

class CustomCarouseSlider extends GetView<HomeControllerImp> {
  const CustomCarouseSlider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HandlingDataView(
      statusRequest:controller.statusRequest,
      widget: CarouselSlider.builder(
        itemCount: controller.dataSlide.length,
        itemBuilder:
            (BuildContext context, int index, int pageViewIndex) {
          return InkWell(
            onTap: (){
              controller.gotToDetails(controller.dataSlide[index].moiveId.toString());
            },
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  '${AppLink.image}/${controller.dataSlide[index].moiveImage}',
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding:const EdgeInsets.only(bottom: 15,left: 15),
                  child: Text(
                    controller.dataSlide[index].moiveName!.toUpperCase(),
                    style: const  TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

              ],
            ),
          );
        },
        options: CarouselOptions(
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration:
          const Duration(milliseconds: 800),
          pauseAutoPlayOnTouch: true,
          viewportFraction: 0.8,
          enlargeCenterPage: true,
        ),
      ),
    );

  }
}

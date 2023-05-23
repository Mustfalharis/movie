import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/class/hindling_data_view.dart';
import '../../controller/movies_actors_controller.dart';
import '../../link_api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../widget/movies_actor/custom_image_actor.dart';
import '../widget/movies_actor/custom_text_movies.dart';
import '../widget/movies_actor/list_movies_actors.dart';

class MoviesActorsScreen extends StatelessWidget {
  const MoviesActorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 Get.put(MoviesActorsControllerImp());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomImageActor(),
              const SizedBox(
                height: 30,
              ),
              const CustomTextMovies(),
              const SizedBox(
                height: 30,
              ),
              ListMoviesActors(),

            ],
          ),
        ),
      ),
    );
  }
}

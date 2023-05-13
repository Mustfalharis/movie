import 'package:get/get.dart';
import 'package:movies_app/core/constant/routes.dart';
import 'package:movies_app/view/screen/details_items_screen.dart';
import 'package:movies_app/view/screen/home_screen.dart';
import 'package:movies_app/view/screen/moives_actors_screen.dart';
List<GetPage<dynamic>>? routes = [
  // start
  GetPage(
      name: "/", page: () => const HomeScreen()),
   GetPage(
      name: AppRoute.details, page: () => const DetailsItemsScreen()),
  GetPage(
      name: AppRoute.moviesActors, page: () => const MoviesActorsScreen()),

];

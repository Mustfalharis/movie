import 'package:get/get.dart';
import 'package:movies_app/core/constant/routes.dart';
import 'package:movies_app/view/screen/all_mvoie_category.dart';
import 'package:movies_app/view/screen/details_items_screen.dart';
import 'package:movies_app/view/screen/favorite_screen.dart';
import 'package:movies_app/view/screen/home_screen.dart';
import 'package:movies_app/view/screen/login_screen.dart';
import 'package:movies_app/view/screen/moives_actors_screen.dart';
import 'package:movies_app/view/screen/settings.dart';
import 'package:movies_app/view/screen/singUp_screen.dart';
List<GetPage<dynamic>>? routes = [
  // start
  GetPage(
      name: "/", page: () => const HomeScreen()),
   GetPage(
      name: AppRoute.details, page: () => const DetailsItemsScreen()),
  GetPage(
      name: AppRoute.moviesActors, page: () => const MoviesActorsScreen()),
  GetPage(
      name: AppRoute.allMovieCategory, page: () => const AllMovieCategoryScreen()),
  GetPage(
      name: AppRoute.favorite, page: () => const FavoriteScreen()),
  GetPage(
      name: AppRoute.login, page: () => const LoginScreen()),
  GetPage(
      name: AppRoute.singUp, page: () => const SingUpScreen()),

];

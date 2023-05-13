import 'package:movies_app/core/class/crud.dart';
import 'package:movies_app/link_api.dart';
class MoviesActorsData{
  Crud card;
  MoviesActorsData(this.card);
  getDataMoviesActors(String actors)async
  {
    var response = await card.postData(
        AppLink.moviesActors,
        {
          'actor':actors,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
}
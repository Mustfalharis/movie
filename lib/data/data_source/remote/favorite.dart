import 'package:movies_app/core/class/crud.dart';
import 'package:movies_app/link_api.dart';
class FavoriteData{
  Crud card;
  FavoriteData(this.card);
  getDataFavorite(String userId)async
  {
    var response = await card.postData(
        AppLink.viewFavorite,
        {
          'userId':userId,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
  getAddFavorite(String userId,String movie)async
  {
    var response = await card.postData(
        AppLink.addFavorite,
        {
          'userId':userId,
          'movie':movie,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
  getDeleteFavorite(String userId,String movie)async
  {
    var response = await card.postData(
        AppLink.deleteFavorite,
        {
          'userId':userId,
          'movie':movie,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
  getAllDeleteFavorite(String userId)async
  {
    var response = await card.postData(
        AppLink.allDeleteFavorite,
        {
          'userId':userId,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
}
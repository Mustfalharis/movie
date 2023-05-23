import 'package:movies_app/core/class/crud.dart';
import 'package:movies_app/link_api.dart';
class SearchData{
  Crud card;
  SearchData(this.card);
  getDataSearch(String search)async
  {
    var response = await card.postData(
        AppLink.search,
        {
          'search':search,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
  addRecentSearches(String userId,movie)async
  {
    var response = await card.postData(
        AppLink.insertSearch,
        {
          'userId':userId,
          'movie':movie,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
  getDataRecentSearches(String userId)async
  {
    var response = await card.postData(
        AppLink.recentSearches,
        {
          'userId':userId,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
  deleteRecentSearches(String userId,String movie)async
  {
    var response = await card.postData(
        AppLink.deleteRecentSearch,
        {
          'userId':userId,
          'movie':movie,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
}

import 'package:movies_app/core/class/crud.dart';
import 'package:movies_app/link_api.dart';
class DetailsData{
  Crud card;
  DetailsData(this.card);
  getDataCategory(String itemId,String userId)async
  {
    var response = await card.postData(
        AppLink.details,
        {
         'itemId':itemId,
          'userId':userId,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
  getDataMovie(String userId,String movie)async
  {
    var response = await card.postData(
        AppLink.detailsMovie,
        {
          'itemId':movie,
          'userId':userId,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
}
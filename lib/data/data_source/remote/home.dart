
import 'package:movies_app/core/class/crud.dart';
import 'package:movies_app/link_api.dart';
class HomeData{
  Crud card;
  HomeData(this.card);
  getData(String userId)async
  {
     var response = await card.postData(
         AppLink.home,
         {
          'userId':userId,
         }
     );
     return response.fold((l) => l, (r) => r);
  }
  getDataCat(String userId)async
  {
    var response = await card.postData(
        AppLink.home,
        {
          'userId':userId,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
  postDataMovieInCat(String cat)async
  {
    var response = await card.postData(
        AppLink.items,
        {
         'categoryid':cat,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
}
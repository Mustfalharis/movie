
import 'package:movies_app/core/class/crud.dart';
import 'package:movies_app/link_api.dart';
class DetailsData{
  Crud card;
  DetailsData(this.card);
  getDataCategory(String itemId)async
  {
    var response = await card.postData(
        AppLink.details,
        {
         'itemId':itemId,
        }
    );
    return response.fold((l) => l, (r) => r);
  }
}
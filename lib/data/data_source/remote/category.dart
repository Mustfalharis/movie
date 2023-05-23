
import 'package:movies_app/core/class/crud.dart';
import 'package:movies_app/link_api.dart';
class CategoryData{
  Crud card;
  CategoryData(this.card);
  getDataCategory()async
  {
    var response = await card.postData(
        AppLink.category,
        {
        }
    );
    return response.fold((l) => l, (r) => r);
  }

}
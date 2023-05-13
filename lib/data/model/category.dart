class CategoryModel {
  String? categoryName;
  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
  }
}

class CategoryModel {
  String? categoryName;
  String? categoryImage;
  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    categoryImage = json['category_img'];
  }
}

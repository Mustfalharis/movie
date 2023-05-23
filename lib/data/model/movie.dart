
class MoiveModel {
  int? moiveId;
  String? moiveName;
  int? moiveCat;
  String? moiveDes;
  double? moiveRating;
  String? moiveProducer;
  dynamic moiveCreate;
  String? moiveImage;
  String? moiveLink;
  int? categoryId;
  String? categoryName;
  int? favorite;
  MoiveModel.fromJson(Map<String, dynamic> json) {
    moiveId = json['moive_id'];
    moiveName = json['moive_name'];
    moiveCat = json['moive_cat'];
    moiveDes = json['moive_des'];
    moiveRating = json['moive_rating'];
    moiveProducer = json['moive_Producer'];
    moiveCreate = json['moive_create'];
    moiveImage = json['moive_image'];
    moiveLink = json['moive_link'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    favorite = json['favorite'];
  }
}

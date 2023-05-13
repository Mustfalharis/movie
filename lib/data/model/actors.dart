class ActorsModel {
  int? actorsId;
  String? actorsName;
  String? actorsImage;
  ActorsModel.fromJson(Map<String, dynamic> json) {
    actorsId = json['actors_id'];
    actorsName = json['actors_name'];
    actorsImage = json['actors_image'];
  }

}

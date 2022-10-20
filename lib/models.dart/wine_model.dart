class WineModel {
  String? winery;
  String? wine;
  Rating? rating;
  String? location;
  String? image;
  int? id;

  WineModel(
      {this.winery,
      this.wine,
      this.rating,
      this.location,
      this.image,
      this.id});

  WineModel.fromJson(Map<String, dynamic> json) {
    winery = json['winery'];
    wine = json['wine'];
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    location = json['location'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['winery'] = this.winery;
    data['wine'] = this.wine;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    data['location'] = this.location;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}

class Rating {
  String? average;
  String? reviews;

  Rating({this.average, this.reviews});

  Rating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    reviews = json['reviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    data['reviews'] = this.reviews;
    return data;
  }
}

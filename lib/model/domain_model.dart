class DomainModel {
  Image image;

  DomainModel({this.image});

  DomainModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    return data;
  }
}

class Image {
  String logoImage;
  String faviconImage;

  Image({this.logoImage, this.faviconImage});

  Image.fromJson(Map<String, dynamic> json) {
    logoImage = json['logoImage'];
    faviconImage = json['faviconImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logoImage'] = this.logoImage;
    data['faviconImage'] = this.faviconImage;
    return data;
  }
}

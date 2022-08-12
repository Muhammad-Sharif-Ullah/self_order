class CustomiseExtraOption {
  String? status;
  List<CustomiseExtraOptions>? customiseExtraOptions;

  CustomiseExtraOption({this.status, this.customiseExtraOptions});

  CustomiseExtraOption.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['customise_extra_options'] != null) {
      customiseExtraOptions = <CustomiseExtraOptions>[];
      json['customise_extra_options'].forEach((v) {
        customiseExtraOptions!.add(new CustomiseExtraOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.customiseExtraOptions != null) {
      data['customise_extra_options'] =
          this.customiseExtraOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomiseExtraOptions {
  String? id;
  String? userId;
  String? customiseExtraId;
  String? label;
  String? image;
  String? price;
  String? baseUrl;
  String? size;

  CustomiseExtraOptions(
      {this.id,
      this.userId,
      this.customiseExtraId,
      this.label,
      this.image,
      this.price,
      this.baseUrl,
      this.size});

  CustomiseExtraOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    customiseExtraId = json['customise_extra_id'];
    label = json['label'];
    image = json['image'];
    price = json['price'];
    baseUrl = json['base_url'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['customise_extra_id'] = this.customiseExtraId;
    data['label'] = this.label;
    data['image'] = this.image;
    data['price'] = this.price;
    data['base_url'] = this.baseUrl;
    data['size'] = this.size;
    return data;
  }
}

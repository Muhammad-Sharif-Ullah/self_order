class CustomiseExtraProduct {
  String? status;
  List<Customiseextra>? customiseextra;

  CustomiseExtraProduct({this.status, this.customiseextra});

  CustomiseExtraProduct.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['customiseextra'] != null) {
      customiseextra = <Customiseextra>[];
      json['customiseextra'].forEach((v) {
        customiseextra!.add(new Customiseextra.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.customiseextra != null) {
      data['customiseextra'] =
          this.customiseextra!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customiseextra {
  String? id;
  String? custId;
  String? price;
  String? calorie;
  String? label;
  Null? makeDefault;
  String? userId;
  String? image;
  String? baseUrl;

  Customiseextra(
      {this.id,
      this.custId,
      this.price,
      this.calorie,
      this.label,
      this.makeDefault,
      this.userId,
      this.image,
      this.baseUrl});

  Customiseextra.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    custId = json['cust_id'];
    price = json['price'];
    calorie = json['calorie'];
    label = json['label'];
    makeDefault = json['make_default'];
    userId = json['user_id'];
    image = json['image'];
    baseUrl = json['base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cust_id'] = this.custId;
    data['price'] = this.price;
    data['calorie'] = this.calorie;
    data['label'] = this.label;
    data['make_default'] = this.makeDefault;
    data['user_id'] = this.userId;
    data['image'] = this.image;
    data['base_url'] = this.baseUrl;
    return data;
  }
}

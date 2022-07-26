class CustomiseProduct {
  String? status;
  List<Customise>? customise;

  CustomiseProduct();

  CustomiseProduct.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['customise'] != null) {
      customise = <Customise>[];
      json['customise'].forEach((v) {
        customise!.add(new Customise.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.customise != null) {
      data['customise'] = this.customise!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customise {
  String? id;
  String? name;
  String? productId;
  String? image;
  String? baseUrl;
  String? userid;
  bool selected = false;

  Customise();

  Customise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productId = json['product_id'];
    image = json['image'];
    baseUrl = json['base_url'];
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['product_id'] = this.productId;
    data['image'] = this.image;
    data['base_url'] = this.baseUrl;
    data['userid'] = this.userid;
    return data;
  }
}

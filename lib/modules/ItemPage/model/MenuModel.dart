class Menu {
  String? status;
  List<Product>? product;

  Menu({this.status, this.product});

  Menu.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? id;
  String? userId;
  String? name;
  String? productDescription;
  String? productPrice;
  String? productImage;
  String? categoryId;
  String? subCategoryId;
  String? productSubsubcategory;
  String? comboImage;
  String? calories;
  String? deliveryOption;
  String? baseUrl;
  String? selectedChrust;
  List<dynamic>? selectedToppings;
  String? selectedStyle;
  List<dynamic>? selectedSauce;
  List<dynamic>? selectedSoda;
  List<dynamic>? selectedSide;
  String? selectedPreparation;
  List<dynamic>? selectedExtra;
  List<dynamic>? selectedBacon;
  String? selectedMeal;
  List<GeneralItem>? chrust;
  List<Toppings>? toppings;
  List<GeneralItem>? style;
  List<GeneralItem>? sauce;
  List<GeneralItem>? soda;
  List<GeneralItem>? dressing;
  List<GeneralItem>? side;
  List<GeneralItem>? preparation;
  List<GeneralItem>? extra;
  List<GeneralItem>? bacon;
  List<GeneralItem>? meal;

  Product(
      {this.id,
      this.userId,
      this.name,
      this.productDescription,
      this.productPrice,
      this.productImage,
      this.categoryId,
      this.subCategoryId,
      this.productSubsubcategory,
      this.comboImage,
      this.calories,
      this.deliveryOption,
      this.baseUrl,
      this.selectedChrust,
      this.selectedToppings,
      this.selectedStyle,
      this.selectedSauce,
      this.selectedSoda,
      this.selectedSide,
      this.selectedPreparation,
      this.selectedExtra,
      this.selectedBacon,
      this.selectedMeal,
      this.chrust,
      this.toppings,
      this.style,
      this.sauce,
      this.soda,
      this.dressing,
      this.side,
      this.preparation,
      this.extra,
      this.bacon,
      this.meal});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    productDescription = json['product_description'];
    productPrice = json['product_price'];
    productImage = json['product_image'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    productSubsubcategory = json['product_subsubcategory'];
    comboImage = json['combo_image'];
    calories = json['calories'];
    deliveryOption = json['delivery_option'];
    baseUrl = json['base_url'];
    selectedChrust = json['selected_chrust'];
    if (json['toppings'] != null) {
      toppings = <Toppings>[];
      json['toppings'].forEach((v) {
        toppings!.add(Toppings.fromJson(v));
      });
    }
    if (json['style'] != null) {
      style = <GeneralItem>[];
      json['style'].forEach((v) {
        style!.add(GeneralItem.fromJson(v));
      });
    }
    if (json['sauce'] != null) {
      sauce = <GeneralItem>[];
      json['sauce'].forEach((v) {
        sauce!.add(GeneralItem.fromJson(v));
      });
    }
    if (json['soda'] != null) {
      soda = <GeneralItem>[];
      json['soda'].forEach((v) {
        soda!.add(GeneralItem.fromJson(v));
      });
    }
    if (json['dressing'] != null) {
      dressing = <GeneralItem>[];
      json['dressing'].forEach((v) {
        dressing!.add(GeneralItem.fromJson(v));
      });
    }
    if (json['side'] != null) {
      side = <GeneralItem>[];
      json['side'].forEach((v) {
        side!.add(GeneralItem.fromJson(v));
      });
    }
    if (json['preparation'] != null) {
      preparation = <GeneralItem>[];
      json['preparation'].forEach((v) {
        preparation!.add(GeneralItem.fromJson(v));
      });
    }
    if (json['extra'] != null) {
      extra = <GeneralItem>[];
      json['extra'].forEach((v) {
        extra!.add(GeneralItem.fromJson(v));
      });
    }
    if (json['bacon'] != null) {
      bacon = <GeneralItem>[];
      json['bacon'].forEach((v) {
        bacon!.add(GeneralItem.fromJson(v));
      });
    }
    if (json['meal'] != null) {
      meal = <GeneralItem>[];
      json['meal'].forEach((v) {
        meal!.add(GeneralItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['product_description'] = this.productDescription;
    data['product_price'] = this.productPrice;
    data['product_image'] = this.productImage;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['product_subsubcategory'] = this.productSubsubcategory;
    data['combo_image'] = this.comboImage;
    data['calories'] = this.calories;
    data['delivery_option'] = this.deliveryOption;
    data['base_url'] = this.baseUrl;
    data['selected_chrust'] = this.selectedChrust;
    if (this.toppings != null) {
      data['toppings'] = this.toppings!.map((v) => v.toJson()).toList();
    }
    if (this.style != null) {
      data['style'] = this.style!.map((v) => v.toJson()).toList();
    }
    if (this.sauce != null) {
      data['sauce'] = this.sauce!.map((v) => v.toJson()).toList();
    }
    if (this.soda != null) {
      data['soda'] = this.soda!.map((v) => v.toJson()).toList();
    }
    if (this.dressing != null) {
      data['dressing'] = this.dressing!.map((v) => v.toJson()).toList();
    }
    if (this.side != null) {
      data['side'] = this.side!.map((v) => v.toJson()).toList();
    }
    if (this.preparation != null) {
      data['preparation'] = this.preparation!.map((v) => v.toJson()).toList();
    }
    if (this.extra != null) {
      data['extra'] = this.extra!.map((v) => v.toJson()).toList();
    }
    if (this.bacon != null) {
      data['bacon'] = this.bacon!.map((v) => v.toJson()).toList();
    }
    if (this.meal != null) {
      data['meal'] = this.meal!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GeneralItem {
  String? name;
  String? price;
  bool selected = false;

  GeneralItem({
    this.name,
    this.price,
  });

  GeneralItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}

class Toppings {
  String? name;
  String? half1;
  String? half2;
  String? whole;
  String? size;

  Toppings({this.name, this.half1, this.half2, this.whole, this.size});

  Toppings.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    half1 = json['half_1'];
    half2 = json['half_2'];
    whole = json['whole'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['half_1'] = this.half1;
    data['half_2'] = this.half2;
    data['whole'] = this.whole;
    data['size'] = this.size;
    return data;
  }
}

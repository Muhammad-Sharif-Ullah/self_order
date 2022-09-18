class Menu {
  String? status;
  List<Product>? product;

  Menu({this.status, this.product});

  Menu.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
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
        if (v is! List) {
          toppings!.add(Toppings.fromJson(v));
        }
      });
    }
    if (json['style'] != null) {
      style = <GeneralItem>[];
      json['style'].forEach((v) {
        if (v is! List) {
          style!.add(GeneralItem.fromJson(v));
        }
      });
    }
    if (json['sauce'] != null) {
      sauce = <GeneralItem>[];

      json['sauce'].forEach((v) {
        if (v is! List) {
          sauce!.add(GeneralItem.fromJson(v));
        }
      });
    }
    if (json['soda'] != null) {
      soda = <GeneralItem>[];
      json['soda'].forEach((v) {
        if (v is! List) {
          soda!.add(GeneralItem.fromJson(v));
        }
      });
    }
    if (json['dressing'] != null) {
      dressing = <GeneralItem>[];

      json['dressing'].forEach((v) {
        if (v is! List) {
          dressing!.add(GeneralItem.fromJson(v));
        }
      });
    }
    if (json['side'] != null) {
      side = <GeneralItem>[];
      json['side'].forEach((v) {
        if (v is! List) {
          side!.add(GeneralItem.fromJson(v));
        }
      });
    }
    if (json['preparation'] != null) {
      preparation = <GeneralItem>[];
      json['preparation'].forEach((v) {
        if (v is! List) {
          preparation!.add(GeneralItem.fromJson(v));
        }
      });
    }
    if (json['extra'] != null && List.from(json['extra']).isNotEmpty) {
      extra = <GeneralItem>[];
      json['extra'].forEach((v) {
        if (v is! List) {
          extra!.add(GeneralItem.fromJson(v));
        }
      });
    }
    if (json['bacon'] != null) {
      bacon = <GeneralItem>[];
      json['bacon'].forEach((v) {
        if (v is! List) {
          bacon!.add(GeneralItem.fromJson(v));
        }
      });
    }
    if (json['meal'] != null) {
      meal = <GeneralItem>[];
      json['meal'].forEach((v) {
        if (v is! List) {
          meal!.add(GeneralItem.fromJson(v));
        }
      });
    }
    if (json['chrust'] != null) {
      chrust = <GeneralItem>[];
      json['chrust'].forEach((v) {
        if (v is! List) {
          chrust!.add(GeneralItem.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['product_description'] = productDescription;
    data['product_price'] = productPrice;
    data['product_image'] = productImage;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['product_subsubcategory'] = productSubsubcategory;
    data['combo_image'] = comboImage;
    data['calories'] = calories;
    data['delivery_option'] = deliveryOption;
    data['base_url'] = baseUrl;
    data['selected_chrust'] = selectedChrust;
    if (toppings != null) {
      data['toppings'] = toppings!.map((v) => v.toJson()).toList();
    }
    if (style != null) {
      data['style'] = style!.map((v) => v.toJson()).toList();
    }
    if (sauce != null) {
      data['sauce'] = sauce!.map((v) => v.toJson()).toList();
    }
    if (soda != null) {
      data['soda'] = soda!.map((v) => v.toJson()).toList();
    }
    if (dressing != null) {
      data['dressing'] = dressing!.map((v) => v.toJson()).toList();
    }
    if (side != null) {
      data['side'] = side!.map((v) => v.toJson()).toList();
    }
    if (preparation != null) {
      data['preparation'] = preparation!.map((v) => v.toJson()).toList();
    }
    if (extra != null) {
      data['extra'] = extra!.map((v) => v.toJson()).toList();
    }
    if (bacon != null) {
      data['bacon'] = bacon!.map((v) => v.toJson()).toList();
    }
    if (meal != null) {
      data['meal'] = meal!.map((v) => v.toJson()).toList();
    }
    if (chrust != null) {
      data['chrust'] = chrust!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['half_1'] = half1;
    data['half_2'] = half2;
    data['whole'] = whole;
    data['size'] = size;
    return data;
  }
}

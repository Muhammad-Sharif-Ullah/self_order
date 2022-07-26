class ProductModel {
  String? id;
  String? userId;
  String? name;
  String? productDescription;
  String? productPrice;
  int quantity = 1;
  String? productImage;
  String? categoryId;
  String? subCategoryId;
  String? productSubsubcategory;
  String? comboImage;
  String? calories;
  String? deliveryOption;
  String? baseUrl;
  int? selectedChrustId;
  int? selectedStyleId;
  int? selectedPreparationId;
  int? selectedMealId;
  late List<SingleSelect> chrust;
  late List<MultiSelect> toppings;
  late List<SingleSelect> style;
  late List<MultiSelect> sauce;
  late List<MultiSelect> soda;
  late List<SingleSelect> dressing;
  late List<MultiSelect> side;
  late List<SingleSelect> preparation;
  late List<MultiSelect> extra;
  late List<MultiSelect> bacon;
  late List<SingleSelect> meal;
  String? productTotal;

  ProductModel();

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    productDescription = json['product_description'];
    productPrice = json['product_price'];
    productTotal = json['product_price'];
    productImage = json['product_image'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    productSubsubcategory = json['product_subsubcategory'];
    comboImage = json['combo_image'];
    calories = json['calories'];
    deliveryOption = json['delivery_option'];
    baseUrl = json['base_url'];
    selectedChrustId = json['selected_chrust_id'];
    selectedStyleId = json['selected_style_id'];
    selectedPreparationId = json['selected_preparation_id'];
    selectedMealId = json['selected_meal_id'];
    if (json['chrust'] != null) {
      chrust = <SingleSelect>[];
      json['chrust'].forEach((v) {
        chrust.add(new SingleSelect.fromJson(v));
      });
    } else {
      chrust = [];
    }
    if (json['toppings'] != null) {
      toppings = <MultiSelect>[];
      json['toppings'].forEach((v) {
        toppings.add(new MultiSelect.fromJson(v));
      });
    }
    if (json['style'] != null) {
      style = <SingleSelect>[];
      json['style'].forEach((v) {
        style.add(new SingleSelect.fromJson(v));
      });
    }
    if (json['sauce'] != null) {
      sauce = <MultiSelect>[];
      json['sauce'].forEach((v) {
        sauce.add(new MultiSelect.fromJson(v));
      });
    }
    if (json['soda'] != null) {
      soda = <MultiSelect>[];
      json['soda'].forEach((v) {
        soda.add(new MultiSelect.fromJson(v));
      });
    }
    if (json['dressing'] != null) {
      dressing = <SingleSelect>[];
      json['dressing'].forEach((v) {
        dressing.add(new SingleSelect.fromJson(v));
      });
    }
    if (json['side'] != null) {
      side = <MultiSelect>[];
      json['side'].forEach((v) {
        side.add(new MultiSelect.fromJson(v));
      });
    }
    if (json['preparation'] != null) {
      preparation = <SingleSelect>[];
      json['preparation'].forEach((v) {
        preparation.add(new SingleSelect.fromJson(v));
      });
    }
    if (json['extra'] != null) {
      extra = <MultiSelect>[];
      json['extra'].forEach((v) {
        extra.add(new MultiSelect.fromJson(v));
      });
    }
    if (json['bacon'] != null) {
      bacon = <MultiSelect>[];
      json['bacon'].forEach((v) {
        bacon.add(new MultiSelect.fromJson(v));
      });
    }
    if (json['meal'] != null) {
      meal = <SingleSelect>[];
      json['meal'].forEach((v) {
        meal.add(new SingleSelect.fromJson(v));
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
    data['selected_chrust_id'] = this.selectedChrustId;
    data['selected_style_id'] = this.selectedStyleId;
    data['selected_preparation_id'] = this.selectedPreparationId;
    data['selected_meal_id'] = this.selectedMealId;
    if (this.chrust != null) {
      data['chrust'] = this.chrust.map((v) => v.toJson()).toList();
    }
    if (this.toppings != null) {
      data['toppings'] = this.toppings.map((v) => v.toJson()).toList();
    }
    if (this.style != null) {
      data['style'] = this.style.map((v) => v.toJson()).toList();
    }
    if (this.sauce != null) {
      data['sauce'] = this.sauce.map((v) => v.toJson()).toList();
    }
    if (this.soda != null) {
      data['soda'] = this.soda.map((v) => v.toJson()).toList();
    }
    if (this.dressing != null) {
      data['dressing'] = this.dressing.map((v) => v.toJson()).toList();
    }
    if (this.side != null) {
      data['side'] = this.side.map((v) => v.toJson()).toList();
    }
    if (this.preparation != null) {
      data['preparation'] = this.preparation.map((v) => v.toJson()).toList();
    }
    if (this.extra != null) {
      data['extra'] = this.extra.map((v) => v.toJson()).toList();
    }
    if (this.bacon != null) {
      data['bacon'] = this.bacon.map((v) => v.toJson()).toList();
    }
    if (this.meal != null) {
      data['meal'] = this.meal.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SingleSelect {
  late String name;
  late String price;

  SingleSelect();

  SingleSelect.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = '0';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = '1';
    return data;
  }
}

class MultiSelect {
  late String name;
  late String price;
  bool selected = false;

  MultiSelect();

  MultiSelect.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = '0';
    selected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['selected'] = this.selected;
    return data;
  }
}

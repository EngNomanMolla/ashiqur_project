// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
        this.popular,
    });

    List<Popular> ? popular;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        popular: List<Popular>.from(json["popular"].map((x) => Popular.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "popular": List<dynamic>.from(popular!.map((x) => x.toJson())),
    };
}

class Popular {
    Popular({
        this.id,
        this.name,
        this.slug,
        this.description,
        this.typeId,
        this.price,
        this.shopId,
        this.salePrice,
        this.sku,
        this.quantity,
        this.inStock,
        this.isTaxable,
        this.shippingClassId,
        this.status,
        this.productType,
        this.purchasePrice,
        this.unit,
        this.height,
        this.width,
        this.length,
        this.image,
        this.gallery,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.maxPrice,
        this.minPrice,
        this.deadline,
        this.targetSale,
        this.delivryDate,
        this.ordersCount,
        this.type,
        this.categories,
    });

    int ?id;
    String ?name;
    String ?slug;
    String ?description;
    int ?typeId;
    int ?price;
    int ?shopId;
    int ?salePrice;
    String ?sku;
    int ?quantity;
    int ?inStock;
    int ?isTaxable;
    dynamic ?shippingClassId;
    Status ?status;
    ProductType ?productType;
    String ?purchasePrice;
    String ?unit;
    dynamic ?height;
    dynamic ?width;
    dynamic ?length;
    ImageElement ?image;
    List<ImageElement> ?gallery;
    dynamic ?deletedAt;
    DateTime ?createdAt;
    DateTime ?updatedAt;
    dynamic ?maxPrice;
    dynamic ?minPrice;
    DateTime ?deadline;
    int ?targetSale;
    DateTime ?delivryDate;
    int ?ordersCount;
    Type ?type;
    List<Category> ?categories;

    factory Popular.fromJson(Map<String, dynamic> json) => Popular(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"] == null ? null : json["description"],
        typeId: json["type_id"],
        price: json["price"],
        shopId: json["shop_id"],
        salePrice: json["sale_price"] == null ? null : json["sale_price"],
        sku: json["sku"],
        quantity: json["quantity"],
        inStock: json["in_stock"],
        isTaxable: json["is_taxable"],
        shippingClassId: json["shipping_class_id"],
        status: statusValues.map![json["status"]],
        productType: productTypeValues.map![json["product_type"]],
        purchasePrice: json["purchase_price"],
        unit: json["unit"],
        height: json["height"],
        width: json["width"],
        length: json["length"],
        image: ImageElement.fromJson(json["image"]),
        gallery: List<ImageElement>.from(json["gallery"].map((x) => ImageElement.fromJson(x))),
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        maxPrice: json["max_price"],
        minPrice: json["min_price"],
        deadline: json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
        targetSale: json["target_sale"] == null ? null : json["target_sale"],
        delivryDate: json["delivry_date"] == null ? null : DateTime.parse(json["delivry_date"]),
        ordersCount: json["orders_count"],
        type: Type.fromJson(json["type"]),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description == null ? null : description,
        "type_id": typeId,
        "price": price,
        "shop_id": shopId,
        "sale_price": salePrice == null ? null : salePrice,
        "sku": sku,
        "quantity": quantity,
        "in_stock": inStock,
        "is_taxable": isTaxable,
        "shipping_class_id": shippingClassId,
        "status": statusValues.reverse[status],
        "product_type": productTypeValues.reverse[productType],
        "purchase_price": purchasePrice,
        "unit": unit,
        "height": height,
        "width": width,
        "length": length,
        "image": image!.toJson(),
        "gallery": List<dynamic>.from(gallery!.map((x) => x.toJson())),
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "max_price": maxPrice,
        "min_price": minPrice,
        "deadline": deadline == null ? null : deadline!.toIso8601String(),
        "target_sale": targetSale == null ? null : targetSale,
        "delivry_date": delivryDate == null ? null : delivryDate!.toIso8601String(),
        "orders_count": ordersCount,
        "type": type!.toJson(),
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        this.id,
        this.menuId,
        this.name,
        this.slug,
        this.icon,
        this.image,
        this.imageIcon,
        this.details,
        this.parent,
        this.typeId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.pivot,
    });

    int ?id;
    int ?menuId;
    String ?name;
    String ?slug;
    Icon ?icon;
    dynamic ?image;
    String ?imageIcon;
    String ?details;
    int ?parent;
    int ?typeId;
    DateTime ?createdAt;
    DateTime ?updatedAt;
    dynamic ?deletedAt;
    Pivot ?pivot;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        menuId: json["menu_id"] == null ? null : json["menu_id"],
        name: json["name"],
        slug: json["slug"],
        icon: json["icon"] == null ? null : iconValues.map![json["icon"]],
        image: json["image"],
        imageIcon: json["image_icon"] == null ? null : json["image_icon"],
        details: json["details"] == null ? null : json["details"],
        parent: json["parent"] == null ? null : json["parent"],
        typeId: json["type_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        pivot: Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "menu_id": menuId == null ? null : menuId,
        "name": name,
        "slug": slug,
        "icon": icon == null ? null : iconValues.reverse[icon],
        "image": image,
        "image_icon": imageIcon == null ? null : imageIcon,
        "details": details == null ? null : details,
        "parent": parent == null ? null : parent,
        "type_id": typeId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "pivot": pivot!.toJson(),
    };
}

enum Icon { FRUITS_VEGETABLE, MEAT_FISH }

final iconValues = EnumValues({
    "FruitsVegetable": Icon.FRUITS_VEGETABLE,
    "MeatFish": Icon.MEAT_FISH
});

class ImageElement {
    ImageElement({
        this.thumbnail,
        this.original,
        this.id,
    });

    String ?thumbnail;
    String ?original;
    int ?id;

    factory ImageElement.fromJson(Map<String, dynamic> json) => ImageElement(
        thumbnail: json["thumbnail"],
        original: json["original"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "original": original,
        "id": id,
    };
}

class Pivot {
    Pivot({
        this.productId,
        this.categoryId,
    });

    int ?productId;
    int ?categoryId;

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        productId: json["product_id"],
        categoryId: json["category_id"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "category_id": categoryId,
    };
}

enum ProductType { SIMPLE }

final productTypeValues = EnumValues({
    "simple": ProductType.SIMPLE
});

enum Status { PUBLISH, DRAFT }

final statusValues = EnumValues({
    "draft": Status.DRAFT,
    "publish": Status.PUBLISH
});

class Type {
    Type({
        this.id,
        this.name,
        this.slug,
        this.icon,
        this.gallery,
        this.createdAt,
        this.updatedAt,
    });

    int ?id;
    Name ?name;
    Slug ?slug;
    Icon ?icon;
    dynamic ?gallery;
    DateTime ?createdAt;
    DateTime ?updatedAt;

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: nameValues.map![json["name"]],
        slug: slugValues.map![json["slug"]],
        icon: iconValues.map![json["icon"]],
        gallery: json["gallery"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "slug": slugValues.reverse[slug],
        "icon": iconValues.reverse[icon],
        "gallery": gallery,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}

enum Name { GROCERY }

final nameValues = EnumValues({
    "Grocery": Name.GROCERY
});

enum Slug { GROCERY }

final slugValues = EnumValues({
    "grocery": Slug.GROCERY
});

class EnumValues<T> {
    Map<String, T> ?map;
    Map<T, String> ?reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse  {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => new MapEntry(v, k));
        }
        return  reverseMap!;
    }
}

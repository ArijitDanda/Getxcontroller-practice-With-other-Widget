import 'dart:convert';

// class makeupmodel {
//   int id;
//   String? brand,
//       name,
//       description,
//       image_link,
//       product_link,
//       website_link,
//       product_type,
//       created_at,
//       updated_at,
//       product_api_url,
//       api_featured_image;
//   double? price, rating;
//   dynamic price_sign;
//   dynamic currency;
//   dynamic category;
//   List<dynamic> tag_list;
//  List<productscolor> colorlist;
//   makeupmodel(
//       this.id,
//       this.brand,
//       this.name,
//       this.price,
//       this.price_sign,
//       this.currency,
//       this.image_link,
//       this.product_link,
//       this.website_link,
//       this.description,
//       this.rating,
//       this.category,
//       this.product_type,
//       this.tag_list,
//       this.created_at,
//       this.updated_at,
//       this.product_api_url,
//       this.api_featured_image,
//       this.colorlist);
//   factory makeupmodel.fronmjson(Map<String, dynamic> json) {
//     List _list = json['product_colors'];
//     return makeupmodel(
//         json['id'],
//         json['brand'],
//         json['name'],
//         json['price'],
//         json['price_sign'],
//         json['currency'],
//         json['image_link'],
//         json['product_link'],
//         json['website_link'],
//         json['description'],
//         json['rating'],
//         json['category'],
//         json['product_type'],
//         json['tag_list'],
//         json['created_at'],
//         json['updated_at'],
//         json['product_api_url'],
//         json['api_featured_image'],
//         json['api_featured_image'],
//         List<productscolor>.from(_list.map((e) => productscolor.fromjson(e))));
//   }
// }

// class productscolor {
//   String hex_value;
//   String? colour_name;
//   productscolor(this.hex_value, this.colour_name);
//   factory productscolor.fromjson(Map<String, dynamic> json) =>
//       productscolor(json['hex_value'], json['colour_name']);
// }

class Welcom {
    Welcom({
        required this.id,
        required this.brand,
        required this.name,
        required this.price,
        this.priceSign,
        this.currency,
        required this.imageLink,
        required this.productLink,
        required this.websiteLink,
        required this.description,
        this.rating,
        this.category,
        required this.productType,
        required this.tagList,
        required this.createdAt,
        required this.updatedAt,
        required this.productApiUrl,
        required this.apiFeaturedImage,
        required this.productColors,
    });

    int id;
    Brand brand;
    String name;
    String price;
    dynamic priceSign;
    dynamic currency;
    String imageLink;
    String productLink;
    String websiteLink;
    String description;
    double? rating;
    String? category;
    String productType;
    List<dynamic> tagList;
    DateTime createdAt;
    DateTime updatedAt;
    String productApiUrl;
    String apiFeaturedImage;
    List<ProductColor> productColors;

    factory Welcom.fromJson(Map<String, dynamic> json) => Welcom(
        id: json["id"],
        brand: brandValues.map[json["brand"]]!,
        name: json["name"],
        price: json["price"],
        priceSign: json["price_sign"],
        currency: json["currency"],
        imageLink: json["image_link"],
        productLink: json["product_link"],
        websiteLink: json["website_link"],
        description: json["description"],
        rating: json["rating"]?.toDouble(),
        category: json["category"],
        productType: json["product_type"],
        tagList: List<dynamic>.from(json["tag_list"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        productApiUrl: json["product_api_url"],
        apiFeaturedImage: json["api_featured_image"],
        productColors: List<ProductColor>.from(json["product_colors"].map((x) => ProductColor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brandValues.reverse[brand],
        "name": name,
        "price": price,
        "price_sign": priceSign,
        "currency": currency,
        "image_link": imageLink,
        "product_link": productLink,
        "website_link": websiteLink,
        "description": description,
        "rating": rating,
        "category": category,
        "product_type": productType,
        "tag_list": List<dynamic>.from(tagList.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "product_api_url": productApiUrl,
        "api_featured_image": apiFeaturedImage,
        "product_colors": List<dynamic>.from(productColors.map((x) => x.toJson())),
    };
}

enum Brand { MAYBELLINE }

final brandValues = EnumValues({
    "maybelline": Brand.MAYBELLINE
});

class ProductColor {
    ProductColor({
        required this.hexValue,
        this.colourName,
    });

    String hexValue;
    String? colourName;

    factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        hexValue: json["hex_value"],
        colourName: json["colour_name"],
    );

    Map<String, dynamic> toJson() => {
        "hex_value": hexValue,
        "colour_name": colourName,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}

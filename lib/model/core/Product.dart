import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(jsonDecode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({this.success, this.products});
  String success;
  List<ProductElement> products;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        success: json["success"],
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class ProductElement {
  int id;
  String name;
  String img;
  String description;
  int price;
  int qty;
  int weight;
  int timesOrdered;

  ProductElement(
      {this.id,
      this.name,
      this.img,
      this.description,
      this.price,
      this.qty,
      this.weight,
      this.timesOrdered});

  factory ProductElement.fromJson(Map<String, dynamic> data) {
    return ProductElement(
      id: data["id"],
      name: data["name"],
      description: data["description"],
      img: data["featured_image"],
      price: data["price"],
      qty: data["quantity"],
      weight: data["weight"],
      timesOrdered: data["no_of_ordered"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "featured_image": img,
      "price": price,
      "quantity": qty,
      "weight": weight,
      "no_of_ordered": timesOrdered
    };
  }
}

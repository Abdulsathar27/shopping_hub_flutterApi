class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  final double rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] is int
          ? json["id"]
          : int.tryParse(json["id"].toString()) ?? 0,

      title: json["title"] ?? "No Title",
      description: json["description"] ?? "No Description",

      image: json["image"] ??
          (json["thumbnail"] ?? ""), // DummyJSON uses "thumbnail"

      price: json["price"] is num
          ? (json["price"] as num).toDouble()
          : double.tryParse(json["price"].toString()) ?? 0.0,

      rating: _parseRating(json),
    );
  }

  static double _parseRating(Map<String, dynamic> json) {
    if (json["rating"] is Map && json["rating"]["rate"] is num) {
      return (json["rating"]["rate"] as num).toDouble(); // FakeStore
    }
    if (json["rating"] is num) {
      return (json["rating"] as num).toDouble(); // DummyJSON
    }
    return 0.0;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "image": image,
      "price": price,
      "rating": rating,
    };
  }
}

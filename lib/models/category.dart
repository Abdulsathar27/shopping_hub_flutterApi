class CategoryModel {
  final int id;
  final String name;
  final String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"] is int
          ? json["id"]
          : int.tryParse(json["id"].toString()) ?? 0,

      name: json["name"] ?? json["title"] ?? "Unknown Category",

      image: json["image"] ??
          (json["thumbnail"] ?? "assets/images/placeholder.png"),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
    };
  }
}

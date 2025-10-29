class UserModel {
  final String email;
  final String name;
  final String? profileImage;

  UserModel({
    required this.email,
    required this.name,
    this.profileImage,
  });

  /// Convert JSON received from any API -> UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json["email"] ?? "",
      name: json["name"] ?? "User",
      profileImage: json["profileImage"],
    );
  }

  /// Convert UserModel -> JSON for local storage or API requests
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
      "profileImage": profileImage,
    };
  }
}

class Validators {
  /// Validate product/text input fields
  static String? validateNotEmpty(String? value, {String fieldName = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName cannot be empty";
    }
    return null;
  }

  /// Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email cannot be empty";
    }
    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  /// Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  /// Price validation (for future product management screens)
  static String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Price cannot be empty";
    }
    final price = double.tryParse(value);
    if (price == null || price <= 0) {
      return "Enter a valid positive price";
    }
    return null;
  }
}

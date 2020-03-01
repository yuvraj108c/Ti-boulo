class Validator {
  static String emptyValidator(String field, String value) {
    return (value == null || value == "") ? field + " cannot be blank." : null;
  }

  static bool isLessThan(String value, int characterCount) {
    return value.length < characterCount;
  }
}

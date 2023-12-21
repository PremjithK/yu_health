class Validators {
  Validators._private();

  // Validate email with regex
  static String? validateEmail(String? value) {
    if (value == '' || value == null) {
      return 'Email cannot be empty';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    if (value == '' || value == null) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must have more than 6 characters';
    } else {
      return null;
    }
  }
}

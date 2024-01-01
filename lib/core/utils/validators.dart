class Validators {
  Validators._private();

  static String? validateName(String? value) {
    if (value == null || value == '') {
      return 'Name Cannot be blank';
    }
    if (value.length < 2) {
      return 'Must have atleast 2 characters';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value == '') {
      return 'Phone Number cannot be blank';
    }
    if (!RegExp(
            r'((\+*)((0[ -]*)*|((91 )*))((\d{12})+|(\d{10})+))|\d{5}([- ]*)\d{6}')
        .hasMatch(value)) {
      return 'Invalid phone number';
    }
    if (value.length != 10) {
      return 'Invalid phone number';
    }
    return null;
  }

  // Validate email with regex
  static String? validateEmail(String? value) {
    if (value == '' || value == null) {
      return 'Email cannot be empty';
    } else if (!RegExp(r'[a-z0-9]+@[a-z]+\.[a-z]{2,3}').hasMatch(value)) {
      return 'Invalid Email format';
    } else {
      return null;
    }
  }

  static String? validateLoginPassword(String? value) {
    if (value == '' || value == null) {
      return 'Password cannot be empty';
    }
    return null;
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

  static String? validateConfirmPassword(
    String? original,
    String? confirmation,
  ) {
    if (confirmation == null || confirmation == '') {
      return 'Confirm password cannot be empty';
    }
    if (original != confirmation) {
      return 'Passwords do not match';
    }
    return null;
  }
}

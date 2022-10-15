class Validator {
  static String? validateName({required String name}) {
    if (name.isEmpty) {
      return 'Name can\'t be empty';
    }

    return null;
  }

  static String? validatePhone({required String phoneNumber}) {
    if (phoneNumber.isEmpty) {
      return 'Phone number can\'t be empty';
    }

    return null;
  }
}

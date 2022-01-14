class Validator {

  static String? email(String? value) {
    if(value!.isEmpty) return 'Email Empty!';
    else if(!value.contains('@') || !value.contains('.com')) return 'EX: example@example.com';
  }

  static String? password(String? value) {
    if(value!.isEmpty) return 'Password Empty!';
    else if(value.length < 8) return 'Password must be at least 8 digit';
  }

}
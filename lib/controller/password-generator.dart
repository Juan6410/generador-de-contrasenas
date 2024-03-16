import 'dart:math';

class PasswordGenerator {
  static String generatePassword(bool includeLowerCase, bool includeUpperCase,
      bool includeNumbers, bool includeSymbols, int passwordLength) {
    String characterSet = '';
    if (includeLowerCase) characterSet += 'abcdefghijklmnopqrstuvwxyz';
    if (includeUpperCase) characterSet += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (includeNumbers) characterSet += '0123456789';
    if (includeSymbols) characterSet += '!@#\$%^&*()-_+=<>/.,';

    String password = '';
    final random = Random();
    for (int i = 0; i < passwordLength; i++) {
      password += characterSet[random.nextInt(characterSet.length)];
    }
    return password;
  }
}




String phoneNumberMasking(String input, {String maskChar = '*'}) {
  if (input.length <= 4) {
    return input; // If string has 4 or fewer characters, return as is
  }
  return input.substring(0, 4) + maskChar * (input.length - 4);
}

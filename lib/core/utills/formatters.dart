import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digits

    // Limit to 16 digits
    if (digitsOnly.length > 16) {
      digitsOnly = digitsOnly.substring(0, 16);
    }

    String formattedText = '';
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formattedText += ' '; // Add space after every 4 digits
      }
      formattedText += digitsOnly[i];
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}




class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), ''); // Only numbers

    if (text.length > 6) {
      text = text.substring(0, 6); // Max length 6 (MMYYYY)
    }

    String formattedText = text;
    if (text.length > 2) {
      formattedText = '${text.substring(0, 2)}/${text.substring(2)}';
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
class CvcFormatter extends TextInputFormatter {
  final int maxLength;

  CvcFormatter({this.maxLength = 4}); // Default max length to 4 for AMEX

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), ''); // Only numbers

    if (text.length > maxLength) {
      text = text.substring(0, maxLength); // Limit to maxLength
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}


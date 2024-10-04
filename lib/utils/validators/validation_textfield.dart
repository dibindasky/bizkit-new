import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/validators/validators.dart';

class ValidationTextField {
  static String? validateTextField(
      {required Validate validate,
      required String labelText,
      required String? value,
      String? password}) {
    switch (validate) {
      case Validate.none:
        return null;

      case Validate.notNull:
        if (value == null || value.isEmpty) {
          if (value == 'Content' && value!.length < 20) {
            return 'Content must be at least 20 characters';
          } else if (labelText == '') {
            return 'Enter $labelText';
          }
          return 'Please enter $labelText';
        }
        break;

      case Validate.emailOrPhone:
        if (isValidEmail(value!)) {
          return null;
        }
        if (isValidPhoneNumber(value)) {
          return null;
        }
        return 'Enter valid email or phone number';

      case Validate.email:
        if (!isValidEmail(value!)) {
          return 'Please enter a valid email address';
        }
        break;

      case Validate.adminEmail:
        if (!isValidEmail(value!)) {
          return 'Please enter a valid email address';
        } else if (value.contains('info@') ||
            value.contains('admin@') ||
            value.contains('sales@')) {
          return null;
        }
        return 'Enter your organization\'s registered email';

      case Validate.password:
        if (value!.length < 8) {
          return 'Password must contain at least 8 characters';
        }
        if (!hasLowerCase(value)) {
          return 'Password must contain lowercase letters';
        } else if (!hasCapsLetter(value)) {
          return 'Password must contain uppercase letters';
        } else if (!hasNumbers(value)) {
          return 'Password must contain numbers';
        } else if (!hasSpecialChar(value)) {
          return 'Password must contain special characters';
        }
        break;

      case Validate.phone:
        if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
          return 'Enter valid phone number (numeric characters only)';
        } else if (value.length != 10) {
          return 'Phone number should have exactly 10 digits';
        }
        break;

      case Validate.ifValidnumber:
        if (value != null && value.isNotEmpty) {
          if (value.length != 10 || !isValidPhoneNumber(value)) {
            return 'Phone Number is not valid';
          }
        }
        return null;

      case Validate.ifValidEmail:
        if (value != null && value.isNotEmpty) {
          if (!isValidEmail(value)) {
            return 'Email is not valid';
          }
        }
        return null;

      case Validate.ifValidWebsite:
        if (value != null && value.isNotEmpty) {
          if (!isURLValid(value)) {
            return 'Enter valid website';
          }
        }
        return null;

      case Validate.website:
        if (!isURLValid(value!)) {
          return 'Enter valid website';
        }
        break;

      case Validate.mobOrLandline:
        if (isValidPhoneNumber(value!)) {
          return null;
        } else if (isValidLandlineNumber(value)) {
          return null;
        } else {
          return 'Enter valid mobile or landline number';
        }

      case Validate.rePassword:
        if (password!.trim() != value) {
          return 'Passwords must be the same';
        }
        break;

      case Validate.ifsc:
        if (value != '' && !isValidIFSC(value!)) {
          return 'Enter valid IFSC code';
        }
        break;

      case Validate.upi:
        if (value != '' && !isValidUpiId(value!)) {
          return 'Enter valid UPI ID';
        }
        break;

      case Validate.gst:
        if (value != '' && !isValidGst(value!)) {
          return 'Enter valid GST number';
        }
        break;

      default:
        if (value == 'Content' && value!.length < 20) {
          return 'Content must be at least 20 characters';
        }
    }
    return null;
  }
}

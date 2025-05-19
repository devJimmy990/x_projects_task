import 'package:x_projects_task/core/helper/localization.dart';

class NetworkValidator {
  static String validate(String? value) {
    if (value != null &&
        value.contains(
          "Developer accounts are limited to 100 requests over a 24 hour period",
        )) {
      return Localization.errorMaxRequest;
    }
    return Localization.errorUnknown;
  }
}

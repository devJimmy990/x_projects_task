import 'package:intl/intl.dart';
import 'package:x_projects_task/core/helper/localization.dart';

extension StringExtension on String {
  String capitalize() {
    return split(
      " ",
    ).map((word) => word[0].toUpperCase() + word.substring(1)).join(" ");
  }
}

extension TimeAgoExtension on DateTime {
  String timeAgo() {
    final now = DateTime.now().toUtc();
    final diff = now.difference(toUtc());

    if (diff.inDays == 0) {
      return Localization.today;
    } else {
      return Localization.dayAgo;
    }
  }

  String toLongDateFormat() {
    final dateFormatter = DateFormat('d MMMM, y');
    final timeFormatter = DateFormat('h:mm a');
    return '${dateFormatter.format(this)} — ${timeFormatter.format(this)}';
  }
}

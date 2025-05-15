import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return split(
      " ",
    ).map((word) => word[0].toUpperCase() + word.substring(1)).join(" ");
  }
}

extension TimeAgoExtension on DateTime {
  String timeAgo() {
    // final yesterday = DateTime.now().toUtc().subtract(const Duration(days: 1));
    // final difference = yesterday.difference(toUtc());

    final now = DateTime.now().toUtc();
    final difference = now.difference(toUtc());

    if (difference.inMinutes < 2) {
      return 'soon';
    } else if (difference.inMinutes < 60) {
      final mins = difference.inMinutes;
      return '${mins == 1 ? "min" : "$mins mins"} ago';
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      return ' ${hours == 1 ? "hour" : "$hours hours"} ago';
    } else {
      final days = difference.inDays;
      return '${days == 1 ? "day" : "$days days"} ago';
    }
  }

  String toLongDateFormat() {
    final dateFormatter = DateFormat('d MMMM, y');
    final timeFormatter = DateFormat('h:mm a');
    return '${dateFormatter.format(this)} — ${timeFormatter.format(this)}';
  }
}

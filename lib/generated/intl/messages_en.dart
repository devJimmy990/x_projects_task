// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "app_name_app": MessageLookupByLibrary.simpleMessage("App"),
    "app_name_news": MessageLookupByLibrary.simpleMessage("News"),
    "bookmark_added": MessageLookupByLibrary.simpleMessage("Added to bookmark"),
    "bookmark_removed": MessageLookupByLibrary.simpleMessage(
      "Removed from bookmark",
    ),
    "day_ago": MessageLookupByLibrary.simpleMessage("day ago"),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "language_arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "language_english": MessageLookupByLibrary.simpleMessage("English"),
    "latest_bookmark": MessageLookupByLibrary.simpleMessage("Latest Bookmark"),
    "latest_news": MessageLookupByLibrary.simpleMessage("Latest News"),
    "search_empty": MessageLookupByLibrary.simpleMessage("No results found"),
    "search_hint": MessageLookupByLibrary.simpleMessage("Search here..."),
    "search_news": MessageLookupByLibrary.simpleMessage("News"),
    "select_language": MessageLookupByLibrary.simpleMessage("Select Language"),
    "select_theme": MessageLookupByLibrary.simpleMessage("Select Theme"),
    "theme_dark": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "theme_light": MessageLookupByLibrary.simpleMessage("Light Mode"),
    "today": MessageLookupByLibrary.simpleMessage("Today"),
  };
}

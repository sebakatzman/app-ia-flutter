import 'package:shared_preferences/shared_preferences.dart';

const String _kTextResponsesCount = 'text_responses_count';

Future<int> getTextResponsesCount() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt(_kTextResponsesCount) ?? 0;
}

void incrementTextResponsesCount() async {
  int prevVal = await getTextResponsesCount();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(_kTextResponsesCount, prevVal + 1);
}

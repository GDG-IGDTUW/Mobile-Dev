import 'package:shared_preferences/shared_preferences.dart';

class StoryStorageService {
  static const String _lastActKey = 'last_completed_act';
  static const String _storyVersionKey = 'story_version';

  static const String currentStoryVersion = 'v1';

  Future<void> saveLastCompletedAct(int actIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lastActKey, actIndex);
    await prefs.setString(_storyVersionKey, currentStoryVersion);
  }

  Future<int> restoreLastCompletedAct() async {
    final prefs = await SharedPreferences.getInstance();

    final savedVersion = prefs.getString(_storyVersionKey);
    final savedAct = prefs.getInt(_lastActKey);

    if (savedVersion == currentStoryVersion && savedAct != null) {
      return savedAct;
    }

    return 0;
  }

  Future<void> clearProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_lastActKey);
    await prefs.remove(_storyVersionKey);
  }
}

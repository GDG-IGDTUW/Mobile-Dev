enum CharacterType { thinker, dreamer, drifter, observer }

enum MoodLevel { low, neutral, high }

class Character {
  final String name;
  final String description;
  final CharacterType type;
  final MoodLevel mood;

  const Character({
    required this.name,
    required this.description,
    required this.type,
    this.mood = MoodLevel.neutral,
  });

  Character copyWith({
    String? name,
    String? description,
    CharacterType? type,
    MoodLevel? mood,
  }) {
    return Character(
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      mood: mood ?? this.mood,
    );
  }
}

class Affirmation {
  final int id;
  final String text;

  Affirmation({required this.id, required this.text});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
    };
  }

  factory Affirmation.fromMap(Map<String, dynamic> map) {
    return Affirmation(
      id: map['id'],
      text: map['text'],
    );
  }
}

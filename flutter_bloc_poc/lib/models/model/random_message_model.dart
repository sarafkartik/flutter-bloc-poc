class RandomMessageModel {
  final String? message;
  final String? author;

  RandomMessageModel(this.message, this.author);

  static RandomMessageModel empty = RandomMessageModel(null, null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RandomMessageModel &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          author == other.author;

  @override
  int get hashCode => message.hashCode ^ author.hashCode;

  @override
  String toString() {
    return 'RandomChatModel{chat: $message, author: $author}';
  }
}

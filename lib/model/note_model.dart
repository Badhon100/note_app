class NoteModel {
  final String title;
  final String description;
  final timeSent;
  final String userId;
  final String noteId;
  NoteModel({
    required this.title,
    required this.description,
    required this.timeSent,
    required this.userId,
    required this.noteId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'timeSent': timeSent,
      'userId': userId,
      'noteId': noteId,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] as String,
      description: map['description'] as String,
      timeSent: map['timeSent'],
      userId: map['userId'] as String,
      noteId: map['noteId'] as String,
    );
  }

}

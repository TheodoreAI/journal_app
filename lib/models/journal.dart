class Journal {
  // Date Transfer Object (DTO)
  String? title;
  String? body;
  DateTime? dateTime;
  int? rating;
  String toStrings() {
    return 'Title: $title, Body: $body, Time: $dateTime, Rating: $rating';
  }
}

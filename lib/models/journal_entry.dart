class JournalEntryFields {
  // Date Transfer Object (DTO)
  String? title;
  String? body;
  String? dateTime;
  int? rating;
  String toStrings() {
    return 'Title: $title, Body: $body, Time: $dateTime, Rating: $rating';
  }
}

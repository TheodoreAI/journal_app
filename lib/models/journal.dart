class Journal {
  // Date Transfer Object (DTO)
  List entries;
  Journal({required this.entries});
  get listEntries {
    return entries;
  }
}

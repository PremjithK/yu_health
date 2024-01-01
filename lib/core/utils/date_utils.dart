class DateConverter {
  DateConverter._();
  static String convertDateToAgeInYears(DateTime date) {
    final ageInDuration = date.difference(DateTime.now());

    return (ageInDuration.inDays / 365)
        .abs()
        .round()
        .toString(); // Converting age in days to years
  }
}

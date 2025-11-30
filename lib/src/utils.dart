import 'date.dart';

extension DateTimeToDate on DateTime {
  Date toDate() => Date(year: year, month: month, day: day);
}

void checkYear(int year) {
  if (year < 1) throw ArgumentError.value(year, 'year', 'must be greater than 0');
}

bool isLeapYear(int year) {
  checkYear(year);
  return (year % 4 == 0) && (year % 100 != 0 || year % 400 == 0);
}

int getDaysInMonth(int year, int month) => switch (month) {
  2 => isLeapYear(year) ? 29 : 28,
  4 || 6 || 9 || 11 => 30,
  1 || 3 || 5 || 7 || 8 || 10 || 12 => 31,
  _ => throw ArgumentError.value(month, 'month', 'must be between 1 and 12'),
};

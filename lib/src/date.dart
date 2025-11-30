import 'utils.dart';

class Date {
  final int year;
  final int month;
  final int day;

  Date({required this.year, required this.month, required this.day}) {
    checkYear(year);

    if (day > getDaysInMonth(year, month)) throw ArgumentError.value(day, 'day', 'must be less than or equal to the number of days in the month');

    if (day < 1) throw ArgumentError.value(day, 'day', 'must be greater than 0');
  }

  factory Date.parse(String date, {String separator = ''}) {
    if (separator.isNotEmpty) {
      var parts = date.split(separator);
      if (parts.length != 3) throw ArgumentError.value(date, 'date', 'must be 3 parts separated by $separator');
      return Date(year: int.parse(parts[0]), month: int.parse(parts[1]), day: int.parse(parts[2]));
    }

    if (date.length != 8) throw ArgumentError.value(date, 'date', 'must be 8 characters long');
    final year = date.substring(0, 4);
    final month = date.substring(4, 6);
    final day = date.substring(6, 8);
    return Date(year: int.parse(year), month: int.parse(month), day: int.parse(day));
  }

  factory Date.current() => DateTime.now().toDate();

  DateTime toDateTime() => DateTime(year, month, day);

  @override
  String toString({String separator = ''}) {
    var yearStr = year.toString().padLeft(4, '0');
    var monthStr = month.toString().padLeft(2, '0');
    var dayStr = day.toString().padLeft(2, '0');
    return [yearStr, monthStr, dayStr].join(separator);
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is Date
      && other.year == year && other.month == month && other.day == day;

  @override
  int get hashCode => Object.hash(year, month, day);
}

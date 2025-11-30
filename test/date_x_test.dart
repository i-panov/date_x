import 'package:date_x/date_x.dart';
import 'package:test/test.dart';

void main() {
  group('Date class tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('should create valid date', () {
      final date = Date(year: 2023, month: 12, day: 25);
      expect(date.year, 2023);
      expect(date.month, 12);
      expect(date.day, 25);
    });

    test('should parse date from string in YYYYMMDD format', () {
      final date = Date.parse('20231225');
      expect(date.year, 2023);
      expect(date.month, 12);
      expect(date.day, 25);
    });

    test('should parse date from string with separator', () {
      final date = Date.parse('2023-12-25', separator: '-');
      expect(date.year, 2023);
      expect(date.month, 12);
      expect(date.day, 25);
    });

    test('should parse date from string with dot separator', () {
      final date = Date.parse('2023.12.25', separator: '.');
      expect(date.year, 2023);
      expect(date.month, 12);
      expect(date.day, 25);
    });

    test('should throw when parsing invalid length string without separator', () {
      expect(() => Date.parse('202312'), throwsArgumentError);
    });

    test('should throw when parsing invalid parts count with separator', () {
      expect(() => Date.parse('2023-12', separator: '-'), throwsArgumentError);
      expect(() => Date.parse('2023-12-25-10', separator: '-'), throwsArgumentError);
    });

    test('should convert to DateTime', () {
      final date = Date(year: 2023, month: 12, day: 25);
      final dateTime = date.toDateTime();
      expect(dateTime.year, 2023);
      expect(dateTime.month, 12);
      expect(dateTime.day, 25);
    });

    test('should format date as string without separator', () {
      final date = Date(year: 2023, month: 1, day: 5);
      expect(date.toString(), '20230105');
    });

    test('should format date as string with separator', () {
      final date = Date(year: 2023, month: 12, day: 25);
      expect(date.toString(separator: '-'), '2023-12-25');
      expect(date.toString(separator: '.'), '2023.12.25');
      expect(date.toString(separator: '/'), '2023/12/25');
    });

    test('should handle equality', () {
      final date1 = Date(year: 2023, month: 12, day: 25);
      final date2 = Date(year: 2023, month: 12, day: 25);
      final date3 = Date(year: 2023, month: 12, day: 26);
      
      expect(date1, equals(date2));
      expect(date1, isNot(equals(date3)));
    });

    test('should get current date', () {
      final currentDate = Date.current();
      final now = DateTime.now();
      
      expect(currentDate.year, now.year);
      expect(currentDate.month, now.month);
      expect(currentDate.day, now.day);
    });

    test('should validate year', () {
      expect(() => Date(year: 0, month: 1, day: 1), throwsArgumentError);
      expect(() => Date(year: -1, month: 1, day: 1), throwsArgumentError);
    });

    test('should validate day in month', () {
      // February in leap year
      expect(() => Date(year: 2024, month: 2, day: 30), throwsArgumentError);
      // February in non-leap year
      expect(() => Date(year: 2023, month: 2, day: 29), throwsArgumentError);
      // April has 30 days
      expect(() => Date(year: 2023, month: 4, day: 31), throwsArgumentError);
    });

    test('should validate month', () {
      expect(() => getDaysInMonth(2023, 13), throwsArgumentError);
      expect(() => getDaysInMonth(2023, 0), throwsArgumentError);
    });
  });
}

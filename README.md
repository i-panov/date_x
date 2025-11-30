# date_x

A lightweight Dart library for date manipulation and formatting. This package provides a simple and intuitive way to work with dates in Dart applications.

## Features

- Create dates with validation
- Parse dates from strings in various formats
- Format dates with custom separators
- Convert between `Date` and `DateTime` objects
- Handle leap years and month boundaries correctly
- Get current date
- Comprehensive equality checking

## Getting started

Add `date_x` to your `pubspec.yaml`:

```yaml
dependencies:
  date_x: ^1.0.0
```

Then run `dart pub get`.

## Usage

Here are some examples of how to use the `date_x` package:

### Creating a Date

```dart
// Create a date using the constructor
final date = Date(year: 2023, month: 12, day: 25);
```

### Parsing Dates

```dart
// Parse date from YYYYMMDD format
final date1 = Date.parse('20231225');

// Parse date with separators
final date2 = Date.parse('2023-12-25', separator: '-');
final date3 = Date.parse('2023.12.25', separator: '.');
```

### Formatting Dates

```dart
final date = Date(year: 2023, month: 12, day: 25);

// Format without separator (default)
print(date.toString()); // 20231225

// Format with custom separators
print(date.toString(separator: '-')); // 2023-12-25
print(date.toString(separator: '.')); // 2023.12.25
print(date.toString(separator: '/')); // 2023/12/25
```

### Working with Current Date

```dart
// Get current date
final currentDate = Date.current();
```

### Converting to DateTime

```dart
final date = Date(year: 2023, month: 12, day: 25);
final dateTime = date.toDateTime(); // Convert to DateTime
```

## Additional information

The `date_x` package is designed to be simple and efficient for date operations in Dart. It handles edge cases like leap years and month boundaries automatically.

For more information, check the API documentation.

Contributions are welcome! Please feel free to submit issues or pull requests on GitHub.

This package is maintained by the community. For questions or support, please open an issue on the repository.

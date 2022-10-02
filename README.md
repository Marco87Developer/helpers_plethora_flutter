![Pub Version (including pre-releases)](https://img.shields.io/pub/v/helpers_plethora_flutter?include_prereleases)
![Dart GitHub Actions](https://github.com/Marco87Developer/helpers_plethora_flutter/actions/workflows/dart.yml/badge.svg)
![GitHub Top Language](https://img.shields.io/github/languages/top/Marco87Developer/helpers_plethora_flutter)

An helpful variety of extensions and enumerations dependent on Flutter.

## Usage

### `DateTime` extension methods

You can determine if a date belongs to a date range:

```dart
final DateTime start = DateTime(2022, 7);
final DateTime end = DateTime(2022, 7, 31);
final DateTimeRange range = DateTimeRange(start: start, end: end);
DateTime(2022, 7, 15).belongsTo(range);
```

### `DateTimeRange` extension methods

You can determine if a date range **belongs to** another date range:

```dart
final DateTimeRange other =
    DateTimeRange(
      start: DateTime(2022),
      end: DateTime(2022, 7, 31),
    );
DateTimeRange(
  start: DateTime(2021, 9),
  end: DateTime(2022),
).belongsTo(other);
```

You can determine if a date range **overlaps**, in part or completely, with the other date range:

```dart
final DateTimeRange other =
    DateTimeRange(
      start: DateTime(2022),
      end: DateTime(2022, 7, 31),
    );
DateTimeRange(
  start: DateTime(2021, 9),
  end: DateTime(2022, 1, 2),
).overlapsWith(other);
```

### `List<DateTimeRange>` extension methods

You can get the sum of the **duration** of *all* intervals in a list *after eliminating all duplicate intervals* (which overlap some interval already present in the list).

```dart
final DateTimeRange range1 =
    DateTimeRange(start: DateTime(2022), end: DateTime(2022, 7));
final DateTimeRange range2 = DateTimeRange(
  start: DateTime(2022, 1, 25),
  end: DateTime(2022, 4, 7),
);
final DateTimeRange range3 =
    DateTimeRange(start: DateTime(2022, 4, 7), end: DateTime(2022, 7));
final DateTimeRange range4 = DateTimeRange(
  start: DateTime(2022, 5, 2),
  end: DateTime(2022, 6, 15),
);
final DateTimeRange range5 = DateTimeRange(
  start: DateTime(2022, 7, 3),
  end: DateTime(2022, 9, 30),
);
final DateTimeRange range6 =
    DateTimeRange(start: DateTime(2022), end: DateTime(2022, 7));
final DateTimeRange range7 = range5;
<DateTimeRange>[range1, range2, range3, range4, range5].duration.inDays;
```

You can get the a **list of date ranges** that **covers the entirety** of the period of the sum of all date ranges in this list, but *without repeating any overlap*:

```dart
final DateTimeRange range1 =
    DateTimeRange(start: DateTime(2022), end: DateTime(2022, 7));
final DateTimeRange range2 = DateTimeRange(
  start: DateTime(2022, 1, 25),
  end: DateTime(2022, 4, 7),
);
final DateTimeRange range3 =
    DateTimeRange(start: DateTime(2022, 4, 7), end: DateTime(2022, 7));
final DateTimeRange range4 = DateTimeRange(
  start: DateTime(2022, 5, 2),
  end: DateTime(2022, 6, 15),
);
final DateTimeRange range5 = DateTimeRange(
  start: DateTime(2022, 7, 3),
  end: DateTime(2022, 9, 30),
);
<DateTimeRange>[range1, range2, range3, range4, range5].minimize();
```

### `TimeOfDay` extension methods

You can determine if a time **is after** another (this > other):

```dart
const TimeOfDay(hour: 7, minute: 35)
    .isAfter(const TimeOfDay(hour: 7, minute: 57));
```

You can determine if a time **is before** another (this < other):

```dart
const TimeOfDay(hour: 12, minute: 20)
    .isBefore(const TimeOfDay(hour: 7, minute: 10));
```

You can get the **string representation** of a time:

```dart
const TimeOfDay(hour: 7, minute: 15).toStringHm();
```

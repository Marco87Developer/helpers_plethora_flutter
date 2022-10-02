import 'package:flutter/material.dart';
import 'package:helpers_plethora_flutter/helpers_plethora_flutter.dart';

void main() {
  /// DateTimeExtension
  final DateTime start = DateTime(2022, 7);
  final DateTime end = DateTime(2022, 7, 31);
  final DateTimeRange range = DateTimeRange(start: start, end: end);
  DateTime(2022, 6, 30).belongsTo(range);

  /// DateTimeRangeExtension
  final DateTimeRange other =
      DateTimeRange(start: DateTime(2022), end: DateTime(2022, 7, 31));
  DateTimeRange(
    start: DateTime(2021, 9),
    end: DateTime(2022),
  ).belongsTo(other);
  DateTimeRange(
    start: DateTime(2022, 8),
    end: DateTime(2022, 8, 7),
  ).overlapsWith(other);

  /// ListDateTimeRangeExtension
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
  <DateTimeRange>[range1, range2, range3, range4, range5].duration.inDays;
  <DateTimeRange>[range1, range2, range3, range4, range5].minimize();

  /// TimeOfDayExtension
  const TimeOfDay(hour: 5, minute: 57)
      .isAfter(const TimeOfDay(hour: 7, minute: 12));
  const TimeOfDay(hour: 7, minute: 35)
      .isBefore(const TimeOfDay(hour: 7, minute: 34));
  const TimeOfDay(hour: 15, minute: 5).toStringHm();
}

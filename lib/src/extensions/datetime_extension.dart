import 'package:flutter/material.dart';

/// This extension adds features to the [DateTime] class.
///
extension DateTimeExtension on DateTime {
  /// Returns whether this date **belongs** to the [dateTimeRange] date range
  /// *(including extremes)* or not ([dateTimeRange]`.start` ⩽ this ⩽
  /// [dateTimeRange]`.end`).
  ///
  /// Given the following:
  ///
  /// ```dart
  /// final DateTime start = DateTime(2022, 7);
  /// final DateTime end = DateTime(2022, 7, 31);
  /// final DateTimeRange range = DateTimeRange(start: start, end: end);
  /// ```
  ///
  /// The following examples apply:
  ///
  /// ```dart
  /// DateTime(2022, 6, 30).belongsTo(range); // isFalse
  /// DateTime(2022, 7).belongsTo(range); // isTrue
  /// DateTime(2022, 7, 15).belongsTo(range); // isTrue
  /// DateTime(2022, 7, 31).belongsTo(range); // isTrue
  /// DateTime(2022, 8).belongsTo(range); // isFalse
  /// ```
  ///
  bool belongsTo(final DateTimeRange dateTimeRange) {
    final bool isIncluded =
        isAfter(dateTimeRange.start) && isBefore(dateTimeRange.end);
    final bool coincidesWithStart = isAtSameMomentAs(dateTimeRange.start);
    final bool coincidesWithEnd = isAtSameMomentAs(dateTimeRange.end);

    return isIncluded || coincidesWithStart || coincidesWithEnd;
  }
}

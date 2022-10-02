import 'package:flutter/material.dart';

import 'datetimerange_extension.dart';

/// This extension adds features to the [List<DateTimeRange>] class.
///
extension ListDateTimeRangeExtension on List<DateTimeRange> {
  /// Returns the sum of the **duration** of *all* intervals in this list *after
  /// eliminating all duplicate intervals* (which overlap some interval already
  /// present in this list).
  ///
  /// To eliminate duplicate ranges this method uses the [minimize] method.
  ///
  /// Given the following:
  ///
  /// ```dart
  /// final DateTimeRange range1 =
  ///     DateTimeRange(start: DateTime(2022), end: DateTime(2022, 7));
  /// final DateTimeRange range2 = DateTimeRange(
  ///   start: DateTime(2022, 1, 25),
  ///   end: DateTime(2022, 4, 7),
  /// );
  /// final DateTimeRange range3 =
  ///     DateTimeRange(start: DateTime(2022, 4, 7), end: DateTime(2022, 7));
  /// final DateTimeRange range4 = DateTimeRange(
  ///   start: DateTime(2022, 5, 2),
  ///   end: DateTime(2022, 6, 15),
  /// );
  /// final DateTimeRange range5 = DateTimeRange(
  ///   start: DateTime(2022, 7, 3),
  ///   end: DateTime(2022, 9, 30),
  /// );
  /// final DateTimeRange range6 =
  ///     DateTimeRange(start: DateTime(2022), end: DateTime(2022, 7));
  /// final DateTimeRange range7 = range5;
  /// ```
  ///
  /// The following examples apply:
  ///
  /// ```dart
  /// <DateTimeRange>[range1, range2, range3, range4, range5]
  ///     .duration
  ///     .inDays; // 270
  /// <DateTimeRange>[range6, range7]
  ///     .duration
  ///     .inDays; // 270
  /// ```
  ///
  Duration get duration {
    final List<DateTimeRange> minimized = minimize();
    return minimized.fold<Duration>(
      Duration.zero,
      (final previousValue, final dateTimeRange) =>
          previousValue + dateTimeRange.duration,
    );
  }

  /// Returns a **list of date ranges** that **covers the entirety** of the
  /// period of the sum of all date ranges in this list, but *without repeating
  /// any overlap*.
  ///
  /// Given the following:
  ///
  /// ```dart
  /// final DateTimeRange range1 =
  ///     DateTimeRange(start: DateTime(2022), end: DateTime(2022, 7));
  /// final DateTimeRange range2 = DateTimeRange(
  ///   start: DateTime(2022, 1, 25),
  ///   end: DateTime(2022, 4, 7),
  /// );
  /// final DateTimeRange range3 =
  ///     DateTimeRange(start: DateTime(2022, 4, 7), end: DateTime(2022, 7));
  /// final DateTimeRange range4 = DateTimeRange(
  ///   start: DateTime(2022, 5, 2),
  ///   end: DateTime(2022, 6, 15),
  /// );
  /// final DateTimeRange range5 = DateTimeRange(
  ///   start: DateTime(2022, 7, 3),
  ///   end: DateTime(2022, 9, 30),
  /// );
  /// final DateTimeRange range6 =
  ///     DateTimeRange(start: DateTime(2022), end: DateTime(2022, 7));
  /// final DateTimeRange range7 = range5;
  /// ```
  ///
  /// The following examples apply:
  ///
  /// ```dart
  /// <DateTimeRange>[range1, range2, range3, range4, range5].minimize();
  ///   // <DateTimeRange>[range6, range7]
  /// <DateTimeRange>[range1, range2, range3].minimize();
  ///   // <DateTimeRange>[range6]
  /// ```
  ///
  List<DateTimeRange> minimize() {
    final List<DateTimeRange> result = [];
    List<DateTimeRange> resultTemp = [];

    List<DateTimeRange> minimizeInternal(final List<DateTimeRange> initial) {
      bool hasAnythingBeenRemoved = false;
      initial.sort((final r1, final r2) {
        // 1º comparison
        final int comparison1 = r1.start.compareTo(r2.start);
        if (comparison1 != 0) return comparison1;
        // Last comparison
        final int comparison2 = r1.end.compareTo(r2.end);
        return comparison2;
      });
      result.add(initial.first);
      for (int i = 1; i < initial.length; i++) {
        if (initial[i].overlapsWith(result.last)) {
          final List<DateTime> fourDates = [
            result.last.start,
            result.last.end,
            initial[i].start,
            initial[i].end,
          ]..sort();
          final DateTimeRange joinRange = DateTimeRange(
            start: fourDates.first,
            end: fourDates.last,
          );
          result
            ..removeLast()
            ..add(joinRange);
          hasAnythingBeenRemoved = true;
        } else {
          result.add(initial[i]);
        }
      }
      if (hasAnythingBeenRemoved) {
        resultTemp = [...result];
        result.clear();
        minimizeInternal(resultTemp);
      }
      return result;
    }

    minimizeInternal(this);
    return result;
  }
}

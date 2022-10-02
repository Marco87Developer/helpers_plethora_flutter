import 'package:flutter/material.dart';

import 'datetime_extension.dart';

/// This extension adds features to the [DateTimeRange] class.
///
extension DateTimeRangeExtension on DateTimeRange {
  /// Returns if this date range **belongs to** the [other] date range, that is,
  /// it is *completely included* in it ([other]`.start` ⩽ [start] ⩽
  /// [other]`.end`, and [other]`.start` ⩽ [end] ⩽ [other]`.end`).
  ///
  /// Given the following:
  ///
  /// ```dart
  /// final DateTimeRange other =
  ///     DateTimeRange(start: DateTime(2022), end: DateTime(2022, 7, 31));
  /// ```
  ///
  /// The following examples apply:
  ///
  /// ```dart
  /// DateTimeRange(
  ///   start: DateTime(2021, 9),
  ///   end: DateTime(2022),
  /// ).belongsTo(other); // isFalse
  /// DateTimeRange(
  ///   start: DateTime(2021, 9),
  ///   end: DateTime(2022, 1, 2),
  /// ).belongsTo(other); // isFalse
  /// DateTimeRange(
  ///   start: DateTime(2022),
  ///   end: DateTime(2022, 7, 31),
  /// ).belongsTo(other); // isTrue
  /// DateTimeRange(
  ///   start: DateTime(2022, 1, 2),
  ///   end: DateTime(2022, 7, 30),
  /// ).belongsTo(other); // isTrue
  /// DateTimeRange(
  ///   start: DateTime(2022, 7, 30),
  ///   end: DateTime(2022, 8),
  /// ).belongsTo(other); // isFalse
  /// ```
  ///
  bool belongsTo(final DateTimeRange other) {
    final bool startBelongsTo = start.belongsTo(other);
    final bool endBelongsTo = end.belongsTo(other);
    return startBelongsTo && endBelongsTo;
  }

  /// Returns if this date range **overlaps**, in part or completely, with the
  /// [other] date range ([other]`.start` ⩽ [start] ⩽ [other]`.end`, or
  /// [other]`.start` ⩽ [end] ⩽ [other]`.end`).
  ///
  /// Given the following:
  ///
  /// ```dart
  /// final DateTimeRange other =
  ///     DateTimeRange(start: DateTime(2022), end: DateTime(2022, 7, 31));
  /// ```
  ///
  /// The following examples apply:
  ///
  /// ```dart
  /// DateTimeRange(
  ///   start: DateTime(2021, 9),
  ///   end: DateTime(2021, 9, 5),
  /// ).overlapsWith(other); // isFalse
  /// DateTimeRange(
  ///   start: DateTime(2021, 9),
  ///   end: DateTime(2022),
  /// ).overlapsWith(other); // isTrue
  /// DateTimeRange(
  ///   start: DateTime(2021, 9),
  ///   end: DateTime(2022, 1, 2),
  /// ).overlapsWith(other); // isTrue
  /// DateTimeRange(
  ///   start: DateTime(2022),
  ///   end: DateTime(2022, 7, 31),
  /// ).overlapsWith(other); // isTrue
  /// DateTimeRange(
  ///   start: DateTime(2022, 1, 2),
  ///   end: DateTime(2022, 7, 30),
  /// ).overlapsWith(other); // isTrue
  /// DateTimeRange(
  ///   start: DateTime(2022, 7, 30),
  ///   end: DateTime(2022, 8),
  /// ).overlapsWith(other); // isTrue
  /// DateTimeRange(
  ///   start: DateTime(2022, 8),
  ///   end: DateTime(2022, 8, 7),
  /// ).overlapsWith(other); // isFalse
  /// ```
  ///
  bool overlapsWith(final DateTimeRange other) {
    final bool startBelongsTo = start.belongsTo(other);
    final bool endBelongsTo = end.belongsTo(other);
    return startBelongsTo || endBelongsTo;
  }
}

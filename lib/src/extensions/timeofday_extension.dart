import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// This extension adds features to the [TimeOfDay] class.
///
extension TimeOfDayExtension on TimeOfDay {
  /// Returns if this time **is after** the [other] (this > [other]).
  ///
  /// Examples:
  ///
  /// ```dart
  /// const TimeOfDay(hour: 5, minute: 57)
  ///     .isAfter(const TimeOfDay(hour: 7, minute: 12)); // isFalse
  /// const TimeOfDay(hour: 7, minute: 35)
  ///     .isAfter(const TimeOfDay(hour: 7, minute: 57)); // isFalse
  /// const TimeOfDay(hour: 7, minute: 35)
  ///     .isAfter(const TimeOfDay(hour: 7, minute: 35)); // isFalse
  /// const TimeOfDay(hour: 7, minute: 35)
  ///     .isAfter(const TimeOfDay(hour: 7, minute: 34)); // isTrue
  /// ```
  ///
  bool isAfter(final TimeOfDay other) =>
      hour > other.hour || (hour == other.hour && minute > other.minute);

  /// Returns if this time **is before** the [other] (this < [other]).
  ///
  /// Examples:
  ///
  /// ```dart
  /// const TimeOfDay(hour: 7, minute: 35)
  ///     .isBefore(const TimeOfDay(hour: 7, minute: 57)); // isTrue
  /// const TimeOfDay(hour: 7, minute: 35)
  ///     .isBefore(const TimeOfDay(hour: 7, minute: 35)); // isFalse
  /// const TimeOfDay(hour: 7, minute: 35)
  ///     .isBefore(const TimeOfDay(hour: 7, minute: 34)); // isFalse
  /// const TimeOfDay(hour: 12, minute: 20)
  ///     .isBefore(const TimeOfDay(hour: 7, minute: 10)); // isFalse
  /// ```
  ///
  bool isBefore(final TimeOfDay other) =>
      hour < other.hour || (hour == other.hour && minute < other.minute);

  /// Returns the **string representation** of this time with:
  ///
  /// * the **[hour]s** and
  /// * the **[minute]s**.
  ///
  /// Examples:
  ///
  /// ```dart
  /// const TimeOfDay(hour: 7, minute: 15).toStringHm(); // '07:15'
  /// const TimeOfDay(hour: 15, minute: 5).toStringHm(); // '15:05'
  /// const TimeOfDay(hour: 12, minute: 35).toStringHm(); // '12:35'
  /// ```
  ///
  String toStringHm() {
    final DateTime date = DateTime(0, 0, 0, hour, minute);
    return DateFormat.Hm().format(date);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helpers_plethora_flutter/src/extensions/timeofday_extension.dart';

void main() {
  group('isAfter:', () {
    test('Must return if a time is after another one (>).', () {
      expect(
        const TimeOfDay(hour: 5, minute: 57)
            .isAfter(const TimeOfDay(hour: 7, minute: 12)),
        isFalse,
      );
      expect(
        const TimeOfDay(hour: 7, minute: 35)
            .isAfter(const TimeOfDay(hour: 7, minute: 57)),
        isFalse,
      );
      expect(
        const TimeOfDay(hour: 7, minute: 35)
            .isAfter(const TimeOfDay(hour: 7, minute: 35)),
        isFalse,
      );
      expect(
        const TimeOfDay(hour: 7, minute: 35)
            .isAfter(const TimeOfDay(hour: 7, minute: 34)),
        isTrue,
      );
    });
  });

  group('isBefore:', () {
    test('Must return if a time is before another one (<).', () {
      expect(
        const TimeOfDay(hour: 7, minute: 35)
            .isBefore(const TimeOfDay(hour: 7, minute: 57)),
        isTrue,
      );
      expect(
        const TimeOfDay(hour: 7, minute: 35)
            .isBefore(const TimeOfDay(hour: 7, minute: 35)),
        isFalse,
      );
      expect(
        const TimeOfDay(hour: 7, minute: 35)
            .isBefore(const TimeOfDay(hour: 7, minute: 34)),
        isFalse,
      );
      expect(
        const TimeOfDay(hour: 12, minute: 20)
            .isBefore(const TimeOfDay(hour: 7, minute: 10)),
        isFalse,
      );
    });
  });

  group('toStringHm:', () {
    test(
      'Must return the localized string representation of this time with the'
      ' hours and the minutes.',
      () {
        expect(const TimeOfDay(hour: 7, minute: 15).toStringHm(), '07:15');
        expect(const TimeOfDay(hour: 15, minute: 5).toStringHm(), '15:05');
        expect(const TimeOfDay(hour: 12, minute: 35).toStringHm(), '12:35');
      },
    );
  });
}

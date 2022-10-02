import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helpers_plethora_flutter/src/extensions/list_datetimerange_extension.dart';

void main() {
  group('duration:', () {
    test(
      'Must return the sum of the duration of all intervals in this list after'
      ' eliminating all duplicate intervals (which overlap some interval'
      ' already present in this list). To eliminate duplicate ranges this'
      ' method uses the minimize method.',
      () {
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
        expect(
          <DateTimeRange>[range1, range2, range3, range4, range5]
              .duration
              .inDays,
          270,
        );
        final DateTimeRange range6 =
            DateTimeRange(start: DateTime(2022), end: DateTime(2022, 7));
        final DateTimeRange range7 = range5;
        expect(<DateTimeRange>[range6, range7].duration.inDays, 270);
      },
    );
  });

  group('minimize:', () {
    test(
        'Must return a list of date ranges that covers the entirety of the'
        ' period of the sum of all date ranges in this list, but without'
        ' repeating any overlap.', () {
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
      expect(
        <DateTimeRange>[range1, range2, range3, range4, range5].minimize(),
        <DateTimeRange>[range6, range7],
      );
      expect(
        <DateTimeRange>[range1, range2, range3].minimize(),
        <DateTimeRange>[range6],
      );
    });
  });
}

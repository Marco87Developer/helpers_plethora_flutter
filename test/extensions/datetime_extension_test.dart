import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helpers_plethora_flutter/src/extensions/datetime_extension.dart';

void main() {
  group('belongsTo:', () {
    test(
      'Must return whether this date belongs to the date range date range'
      ' (including extremes) or not (start ⩽ this ⩽ end).',
      () {
        final DateTime start = DateTime(2022, 7);
        final DateTime end = DateTime(2022, 7, 31);
        final DateTimeRange range = DateTimeRange(start: start, end: end);
        expect(DateTime(2022, 6, 30).belongsTo(range), isFalse);
        expect(DateTime(2022, 7).belongsTo(range), isTrue);
        expect(DateTime(2022, 7, 15).belongsTo(range), isTrue);
        expect(DateTime(2022, 7, 31).belongsTo(range), isTrue);
        expect(DateTime(2022, 8).belongsTo(range), isFalse);
      },
    );
  });
}

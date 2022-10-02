import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helpers_plethora_flutter/src/extensions/datetimerange_extension.dart';

void main() {
  group('belongsTo:', () {
    test(
      'Must return if this date range belongs to the other one, that is, it is'
      ' completely included in it (other.start ⩽ [start] ⩽ other.start.end,'
      ' and other.start ⩽ [end] ⩽ other.end).',
      () {
        final DateTimeRange other =
            DateTimeRange(start: DateTime(2022), end: DateTime(2022, 7, 31));
        expect(
          DateTimeRange(
            start: DateTime(2021, 9),
            end: DateTime(2022),
          ).belongsTo(other),
          isFalse,
        );
        expect(
          DateTimeRange(
            start: DateTime(2021, 9),
            end: DateTime(2022, 1, 2),
          ).belongsTo(other),
          isFalse,
        );
        expect(
          DateTimeRange(
            start: DateTime(2022),
            end: DateTime(2022, 7, 31),
          ).belongsTo(other),
          isTrue,
        );
        expect(
          DateTimeRange(
            start: DateTime(2022, 1, 2),
            end: DateTime(2022, 7, 30),
          ).belongsTo(other),
          isTrue,
        );
        expect(
          DateTimeRange(
            start: DateTime(2022, 7, 30),
            end: DateTime(2022, 8),
          ).belongsTo(other),
          isFalse,
        );
      },
    );
  });

  group('overlapsWith:', () {
    test(
      'Must return if this date range overlaps, in part or completely, with the'
      ' other one (other.start ⩽ start ⩽ other.end, or other.start ⩽ end ⩽'
      ' other.end).',
      () {
        final DateTimeRange other =
            DateTimeRange(start: DateTime(2022), end: DateTime(2022, 7, 31));
        expect(
          DateTimeRange(
            start: DateTime(2021, 9),
            end: DateTime(2021, 9, 5),
          ).overlapsWith(other),
          isFalse,
        );
        expect(
          DateTimeRange(
            start: DateTime(2021, 9),
            end: DateTime(2022),
          ).overlapsWith(other),
          isTrue,
        );
        expect(
          DateTimeRange(
            start: DateTime(2021, 9),
            end: DateTime(2022, 1, 2),
          ).overlapsWith(other),
          isTrue,
        );
        expect(
          DateTimeRange(
            start: DateTime(2022),
            end: DateTime(2022, 7, 31),
          ).overlapsWith(other),
          isTrue,
        );
        expect(
          DateTimeRange(
            start: DateTime(2022, 1, 2),
            end: DateTime(2022, 7, 30),
          ).overlapsWith(other),
          isTrue,
        );
        expect(
          DateTimeRange(
            start: DateTime(2022, 7, 30),
            end: DateTime(2022, 8),
          ).overlapsWith(other),
          isTrue,
        );
        expect(
          DateTimeRange(
            start: DateTime(2022, 8),
            end: DateTime(2022, 8, 7),
          ).overlapsWith(other),
          isFalse,
        );
      },
    );
  });
}

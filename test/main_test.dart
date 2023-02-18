import 'package:flutter_test/flutter_test.dart';

void main() {
  test('1+1', () async {
    final result = 1 + 1;
    expect(result, 2);
  });

  test('isNull', () async {
    int? test;
    expect(test, isNull);
  });

  test('isNotNull', () async {
    int? test = 0;
    expect(test, isNotNull);
  });

  test('same(a), isNot(a)', () async {
    final test1 = Object();
    final test2 = test1;
    final test3 = Object();

    expect(test1, same(test2));
    expect(test1, isNot(test3));

    final test5 = 1;
    final test6 = 1;
    expect(test5, same(test6));
  });

  test('isNot', () async {
    expect(1 + 1, 2);
    expect(1 + 1, isNot(3));
  });

  test('isTrue, isFalse', () async {
    final test = 1 == 1;
    expect(test, isTrue);
    expect(1 == 2, isFalse);
  });

  test('isNaN, isNotNaN', () async {
    expect(0 / 0, isNaN);
    expect(1 / 1, isNotNaN);

    expect(1 / 0, double.infinity);
  });
  test('1, equals(1), isZero, isNonZero', () async {
    final test = 1;
    expect(test, 1);
    expect(test, equals(1));

    expect(0, isZero);
    expect(test, isNonZero);
  });

  test('isPositive, isNegative, isNonNegative, isNonPositive', () async {
    expect(1, isPositive);
    expect(-1, isNegative);

    expect(1, isNonNegative);
    expect(-1, isNonPositive);

    expect(0, isNonNegative);
    expect(0, isNonPositive);
  });

  test(
      'greaterThan(0), greaterThanOrEqualTo(0), lessThan(2), lessThanOrEqualTo(2)',
      () async {
    expect(0.1, greaterThan(0));

    expect(0, greaterThanOrEqualTo(0));
    expect(0.1, greaterThanOrEqualTo(0));

    expect(1.9, lessThan(2));

    expect(2, lessThanOrEqualTo(2));
    expect(1.9, lessThanOrEqualTo(2));
  });

  test('inClosedOpenRange(0,2), inOpenClosedRange(0,2)', () async {
    expect(0, inClosedOpenRange(0, 2));
    expect(1, inClosedOpenRange(0, 2));
    expect(1.9, inClosedOpenRange(0, 2));

    expect(0.1, inOpenClosedRange(0, 2));
    expect(1, inOpenClosedRange(0, 2));
    expect(2, inOpenClosedRange(0, 2));
  });

  test('inInclusiveRange(0,2), inExclusiveRange(0,2)', () async {
    expect(0, inInclusiveRange(0, 2));
    expect(1, inInclusiveRange(0, 2));
    expect(2, inInclusiveRange(0, 2));

    expect(0.1, inExclusiveRange(0, 2));
    expect(1, inExclusiveRange(0, 2));
    expect(1.9, inExclusiveRange(0, 2));
  });

  test('closeTo(2, 1)', () async {
    expect(2, closeTo(2, 1));
    expect(1, closeTo(2, 1));
    expect(3, closeTo(2, 1));
  });
}

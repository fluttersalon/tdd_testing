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
  test('abcd', () async {
    final abcd = 'abcd';
    expect(abcd, 'abcd');
    expect(abcd, isNot('abc'));
  });

  test('equals(‘abcd’), equalsIgnoringCase(‘abcd’)', () async {
    final abcd = 'abcd';
    expect(abcd, equals('abcd'));

    expect('abcd', equalsIgnoringCase('abcd'));
    expect('ABCD', equalsIgnoringCase('abcd'));
    expect('abCD', equalsIgnoringCase('abcd'));

    expect('abcde', isNot(equalsIgnoringCase('abcd')));
  });

  test('equalsIgnoringWhitespace(‘abcd’)', () async {
    expect('abcd', equalsIgnoringWhitespace('abcd'));
    expect(' abcd', equalsIgnoringWhitespace('abcd'));
    expect('abcd ', equalsIgnoringWhitespace('abcd'));
    expect('abcd　', equalsIgnoringWhitespace('abcd'));

    expect('ab cd', isNot(equalsIgnoringWhitespace('abcd')));
  });

  test('contains(‘a’)', () async {
    expect('a', contains('a'));
    expect('abc', contains('a'));
    expect('dad', contains('a'));
    expect('abc', contains('ab'));

    expect('dd', isNot(contains('a')));
  });

  test('artsWith(‘a’), endsWith(‘d’)', () async {
    expect('abcd', startsWith('a'));
    expect('abcd', startsWith('ab'));
    expect('bcd', isNot(startsWith('ab')));

    expect('abcd', endsWith('d'));
    expect('abcd', endsWith('cd'));
    expect('abcd', isNot('bc'));
  });

  test('stringContainsInOrder([‘a’, ‘b’, ‘c’, ‘d’])', () async {
    expect('abcd', stringContainsInOrder(['a', 'b', 'c', 'd']));
    expect('aabcd', stringContainsInOrder(['a', 'b', 'c', 'd']));
    expect('abAcDdD', stringContainsInOrder(['a', 'b', 'c', 'd']));

    expect('abc', isNot(stringContainsInOrder(['a', 'b', 'c', 'd'])));
    expect('abdc', isNot(stringContainsInOrder(['a', 'b', 'c', 'd'])));

    expect('adbcd', stringContainsInOrder(['a', 'b', 'c', 'd']));
  });
}

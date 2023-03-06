import 'dart:async';

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

  group('Set, List, Map', () {
    test('set', () async {
      final set = {1, 2, 3};
      expect(set, {1, 2, 3});
      expect(set, {1, 3, 2});
      expect(set, {1, 2, 3, 3});
      expect(set, isNot({1, 2}));
      expect(set, isNot({1, 2, 3, 4}));
    });

    test('list', () async {
      final list = [1, 2, 3];
      expect(list, [1, 2, 3]);
      expect(list, isNot([1, 3, 2]));
      expect(list, isNot([1, 2]));
      expect(list, isNot([1, 2, 3, 4]));
    });

    test('map', () async {
      final map = {1: '1', 2: '2', 3: '3'};
      expect(map, {1: '1', 2: '2', 3: '3'});
      expect(map, {1: '1', 3: '3', 2: '2'});

      expect(map, isNot({1: '1', 2: '2'}));
      expect(map, isNot({1: '1', 2: '2', 3: '3', 4: '4'}));
      expect(map, isNot({1: '1', 2: '2', 4: '3'}));
      expect(map, isNot({1: '1', 2: '2', 3: '4'}));
    });

    test('hasLength', () async {
      expect({1, 2, 3}, hasLength(3));
      expect([1, 2, 3], hasLength(3));
      expect({1: '1', 2: '2', 3: '3'}, hasLength(3));

      expect({1, 2}, isNot(hasLength(3)));
      expect([1, 2], isNot(hasLength(3)));
      expect({1: '1', 2: '2'}, isNot(hasLength(3)));
    });

    test('contains', () async {
      expect({1, 2, 3}, contains(1));
      expect([1, 2, 3], contains(1));
      expect({1: '1', 2: '2', 3: '3'}, contains(1));

      expect({1: '1', 2: '2', 4: '3'}, contains(4));
      expect({1: 1, 2: 2, 3: 4}, isNot(contains(4)));
      expect({1: '1', 2: '2', 4: '3'}, isNot(contains({1: '1'})));
    });

    test('containsAll', () async {
      expect({1, 2, 3}, containsAll({1, 2}));
      expect([1, 2, 3], containsAll([1, 2]));

      expect({1, 2, 3}, isNot(containsAll({1, 2, 4})));
      expect([1, 2, 3], isNot(containsAll([1, 2, 4])));

      expect({1, 2, 3}, containsAll([1, 2]));
      expect([1, 2, 3], containsAll({1, 2}));

      expect({1: '1', 2: '2', 3: '3'}, isNot(containsAll([1, 2])));
      expect({1: '1', 2: '2', 3: '3'}.keys, containsAll([1, 2]));
      expect({1: '1', 2: '2', 3: '3'}.values, containsAll(['1', '2']));

      // コンパイルエラー
      //expect({1: '1', 2: '2', 4: '3'}, containsAll({1: '1'}));
    });

    test('containsAllInOrder', () async {
      expect({1, 2, 3}, containsAllInOrder({1, 2}));
      expect([1, 2, 3], containsAllInOrder([1, 2]));

      expect({1, 2, 3}, isNot(containsAllInOrder({1, 2, 4})));
      expect([1, 2, 3], isNot(containsAllInOrder([1, 2, 4])));

      expect({1, 2, 3}, isNot(containsAllInOrder({3, 2})));
      expect([1, 2, 3], isNot(containsAllInOrder([3, 2])));
      expect({1, 2, 3}, containsAll({3, 2}));
      expect([1, 2, 3], containsAll([3, 2]));

      expect({1, 2, 3}, containsAllInOrder([1, 2]));
      expect([1, 2, 3], containsAllInOrder({1, 2}));

      expect({1: '1', 2: '2', 3: '3'}.keys, containsAllInOrder([1, 2]));
      expect({1: '1', 2: '2', 3: '3'}.values, containsAllInOrder(['1', '2']));
    });

    test('orderedEquals', () async {
      expect({1, 2, 3}, orderedEquals({1, 2, 3}));
      expect([1, 2, 3], orderedEquals([1, 2, 3]));

      expect({1, 2, 3}, orderedEquals([1, 2, 3]));
      expect([1, 2, 3], orderedEquals({1, 2, 3}));

      expect({1, 2, 3}, isNot(orderedEquals({1, 2})));
      expect([1, 2, 3], isNot(orderedEquals([1, 2])));
      expect({1, 2, 3}, isNot(orderedEquals({1, 2, 3, 4})));
      expect([1, 2, 3], isNot(orderedEquals([1, 2, 3, 4])));
      expect({1, 2, 3}, isNot(orderedEquals({1, 2, 4})));
      expect([1, 2, 3], isNot(orderedEquals([1, 2, 4])));

      expect({1, 2, 3}, orderedEquals({1, 3, 2}));
      expect({1, 2, 3}, orderedEquals({1, 3, 2, 3}));
      expect([1, 2, 3], isNot(orderedEquals([1, 3, 2])));
      expect([1, 3, 2], isNot(orderedEquals([1, 2, 3])));
    });

    test('unorderedEquals', () async {
      expect({1, 2, 3}, unorderedEquals({1, 2, 3}));
      expect([1, 2, 3], unorderedEquals([1, 2, 3]));
      expect({1, 2, 3}, unorderedEquals({1, 3, 2}));
      expect([1, 2, 3], unorderedEquals([1, 3, 2]));
      expect({1, 2, 3}, unorderedEquals([1, 3, 2]));
      expect([1, 2, 3], unorderedEquals({1, 3, 2}));

      expect({1, 2, 3}, isNot(unorderedEquals({1, 2})));
      expect([1, 2, 3], isNot(unorderedEquals([1, 2])));
      expect({1, 2, 3}, isNot(unorderedEquals({1, 2, 3, 4})));
      expect([1, 2, 3], isNot(unorderedEquals([1, 2, 3, 4])));
      expect({1, 2, 3}, isNot(unorderedEquals({1, 2, 4})));
      expect([1, 2, 3], isNot(unorderedEquals([1, 2, 4])));
    });
  });

  group('Stream', () {
    StreamController<int> controllerWith12Close() {
      final controller = StreamController<int>();
      controller.add(1);
      controller.add(2);
      controller.close();
      return controller;
    }

    test('emitsInOrder', () async {
      final controller = StreamController<int>();
      controller.add(1);
      controller.add(2);
      controller.close();
      expect(controller.stream, emitsInOrder([1, 2, emitsDone]));

      expect(controllerWith12Close().stream, emitsInOrder([1, 2, emitsDone]));
    });

    test('emitsDone', () async {
      expect(controllerWith12Close().stream, emitsInOrder([1]));

      //expect(controllerWith12Close().stream, emitsInOrder([1, emitsDone]));
      // -> fault
    });

    test('emitsAnyOf', () async {
      expect(controllerWith12Close().stream, emitsAnyOf([1]));
      expect(controllerWith12Close().stream, emitsAnyOf([1, 2]));

      //expect(controllerWith12Close().stream, emitsAnyOf([2]));
      // →false
    });

    test('event number', () async {
      final controller = StreamController<int>();
      controller.add(1);
      controller.close();
      expect(await controller.stream.length, 1);
    });

    test('emitsInOrder with matcher', () async {
      final controller = StreamController<int>();
      controller.add(1);
      controller.add(2);
      controller.close();

      expect(
        controller.stream,
        emitsInOrder([
          emitsAnyOf([0, 1]),
          lessThan(3),
          emitsDone,
        ]),
      );
    });
  });

  test('emitsInAnyOrder', () async {
    final controller = StreamController<int>();
    controller.add(1);
    controller.add(2);
    controller.close();
    expect(controller.stream, emitsInAnyOrder([2, 1]));
  });

  test('emitsThrough', () async {
    final controller = StreamController<int>();
    controller.add(1);
    controller.add(2);
    controller.close();
    expect(controller.stream, emitsThrough(1));
  });

  test('neverEmits', () async {
    final controller = StreamController<int>();
    controller.add(1);
    controller.add(2);
    controller.close();
    expect(controller.stream, neverEmits(isNegative));
  });

  test('mayEmit', () async {
    final controller = StreamController<int>();
    controller.add(1);
    controller.add(2);
    controller.close();
    // このmatcherは常に成功します
    expect(controller.stream, mayEmit(3));
  });

  test('mayEmitMultiple', () async {
    final controller = StreamController<int>();
    controller.add(1);
    controller.add(2);
    controller.close();
    // このmatcherは常に成功します
    expect(controller.stream, mayEmitMultiple(3));
  });
}

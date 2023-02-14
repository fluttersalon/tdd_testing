import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

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
}

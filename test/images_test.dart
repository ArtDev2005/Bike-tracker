import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:bike_tracker/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.forest).existsSync(), isTrue);
    expect(File(Images.userIcon).existsSync(), isTrue);
  });
}

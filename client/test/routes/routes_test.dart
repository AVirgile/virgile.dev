// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:client/routes/router.dart';
import 'package:client/unkown/unkown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('routes', () {
    test('get nav keys', () {
      final delegate = HomeRouterDelegate();
      var res = false;
      if (delegate.navigatorKey.toString().isNotEmpty) {
        res = true;
      }
      expect(res, true);
    });
  });
}

// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:client/unkown/unkown.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('Unknown', () {
    testWidgets('renders Unknow', (tester) async {
      await tester.pumpUrl('error');
      expect(find.byType(UnkownForm), findsOneWidget);
    });
  });
}

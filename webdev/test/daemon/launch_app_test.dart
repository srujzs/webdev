// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@Timeout(Duration(minutes: 2))
library;

import 'package:test/test.dart';

import '../test_utils.dart';
import 'utils.dart';

void main() {
  late String exampleDirectory;

  final testRunner = TestRunner();
  setUpAll(() async {
    await testRunner.setUpAll();
    exampleDirectory = await testRunner.prepareWorkspace();
  });

  tearDownAll(testRunner.tearDownAll);

  test('--launch-app launches the specified app', () async {
    final webdev = await testRunner.runWebDev(
        ['daemon', '--launch-app=web/scopes.html'],
        workingDirectory: exampleDirectory);
    final appId = await waitForAppId(webdev);

    // The example app does an initial print.
    await expectLater(
        webdev.stdout,
        emitsThrough(
            startsWith('[{"event":"app.log","params":{"appId":"$appId",'
                '"log":"Initial print from scopes app\\n"}}')));
    await exitWebdev(webdev);
  });
}

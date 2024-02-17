// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_calibrate_parameter_library.dart';

final class _SetCalibrateParameterHttp implements SetCalibrateParameterEndpoint {
  const _SetCalibrateParameterHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<void> fetch(CalibrateItem item) async {
    final client = ShortcamClient(inner: _inner);
    final uri = Uri.parse('measurement/CalibrateParam');
    await client.postJson(uri, body: item.toJson());
  }
}

// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_unit_library.dart';

final class _SetUnitHttp implements SetUnitEndpoint {
  const _SetUnitHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<void> fetch(DeviceUnit deviceUnit) async {
    final client = ShortcamClient(inner: _inner);
    final uri = Uri.parse('device/unit');
    await client.postJson(uri, body: deviceUnit.toJson());
  }
}

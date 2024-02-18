// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_leakage_library.dart';

final class _SetLeakageHttp implements SetLeakageEndpoint {
  const _SetLeakageHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<void> fetch(Leakage leakage) async {
    final client = ShortcamClient(inner: _inner);

    final uri = Uri.parse('measurement/quickCheck');
    await client.postJson(uri, body: leakage.toJson());
  }
}

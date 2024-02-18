// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_leakage_library.dart';

final class _GetLeakageHttp implements GetLeakageEndpoint {
  const _GetLeakageHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<Leakage> fetch() async {
    final client = ShortcamClient<Leakage>(
      inner: _inner,
      dataParser: Leakage.fromJson,
    );
    final uri = Uri.parse('measurement/quickCheck');
    final leakage = await client.getJson(uri);

    return leakage!;
  }
}

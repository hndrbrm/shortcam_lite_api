// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'flat_field_correction_library.dart';

final class _FlatFieldCorrectionHttp implements FlatFieldCorrectionEndpoint {
  const _FlatFieldCorrectionHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<void> fetch() async {
    final client = ShortcamClient(
      inner: _inner,
    );
    final uri = Uri.parse('device/ffc');
    await client.getJson(uri);
  }
}

// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'guogai_calibrate_library.dart';

final class _GuogaiCalibrateHttp implements GuogaiCalibrateEndpoint {
  const _GuogaiCalibrateHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<void> fetch() async {
    final client = ShortcamClient(
      inner: _inner,
    );
    final uri = Uri.parse('device/guogaiCalibrate');
    await client.getJson(uri);
  }
}

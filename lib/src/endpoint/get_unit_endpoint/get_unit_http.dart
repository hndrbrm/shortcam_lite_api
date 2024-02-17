// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_unit_library.dart';

final class _GetUnitHttp implements GetUnitEndpoint {
  const _GetUnitHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<DeviceUnit> fetch() async {
    final client = ShortcamClient<DeviceUnit>(
      inner: _inner,
      dataParser: DeviceUnit.fromJson,
    );
    final uri = Uri.parse('device/unit');
    final deviceUnit = await client.getJson(uri);

    return deviceUnit!;
  }
}

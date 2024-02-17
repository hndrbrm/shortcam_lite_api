// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of '../endpoint.dart';

final class _DeviceInfoHttp implements DeviceInfoEndpoint {
  const _DeviceInfoHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<Result<DeviceInfo>> fetch() async {
    final client = JsonClient(
      inner: _inner,
    );
    final uri = Uri.parse('device/info');
    final Map<String, dynamic> json = await client.getJson(uri);

    return Result<DeviceInfo>.fromJson(json, DeviceInfo.fromJson);
  }
}

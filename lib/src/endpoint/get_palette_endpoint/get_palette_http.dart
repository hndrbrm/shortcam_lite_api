// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of '../endpoint.dart';

final class _GetPaletteHttp implements GetPaletteEndpoint {
  const _GetPaletteHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<Palette> fetch() async {
    final client = ShortcamClient<Palette>(
      inner: _inner,
      dataParser: Palette.fromJson,
    );
    final uri = Uri.parse('device/palette');
    final palette = await client.getJson(uri);

    return palette!;
  }
}

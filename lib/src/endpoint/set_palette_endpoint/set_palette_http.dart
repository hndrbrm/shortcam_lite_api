// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_palette_library.dart';

final class _SetPaletteHttp implements SetPaletteEndpoint {
  const _SetPaletteHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<void> fetch([ Palette? palette ]) async {
    final newPalette = palette ?? Palette.rainbow;

    final client = ShortcamClient(
      inner: _inner,
      dataParser: Palette.fromJson,
    );
    final uri = Uri.parse('device/palette');
    await client.postJson(uri, body: newPalette.toJson());
  }
}

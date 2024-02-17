// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_palette_library.dart';

abstract interface class SetPaletteEndpoint {
  factory SetPaletteEndpoint({
    Client? inner,
  }) = _SetPaletteHttp;

  factory SetPaletteEndpoint.http({
    Client? inner,
  }) = _SetPaletteHttp;

  factory SetPaletteEndpoint.successMock({
    Client? inner,
  }) = _SetPaletteSuccessMock;

  factory SetPaletteEndpoint.failedMock({
    Client? inner,
  }) = _SetPaletteFailedMock;

  Future<void> fetch(Palette palette);
}

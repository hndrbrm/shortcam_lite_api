// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of '../endpoint.dart';

abstract interface class GetPaletteEndpoint {
  factory GetPaletteEndpoint({
    Client? inner,
  }) = _GetPaletteHttp;

  factory GetPaletteEndpoint.http({
    Client? inner,
  }) = _GetPaletteHttp;

  factory GetPaletteEndpoint.successMock({
    Client? inner,
  }) = _GetPaletteSuccessMock;

  factory GetPaletteEndpoint.failedMock({
    Client? inner,
  }) = _GetPaletteFailedMock;

  Future<Palette> fetch();
}

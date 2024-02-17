// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'flat_field_correction_library.dart';

abstract interface class FlatFieldCorrectionEndpoint {
  factory FlatFieldCorrectionEndpoint({
    Client? inner,
  }) = _FlatFieldCorrectionHttp;

  factory FlatFieldCorrectionEndpoint.http({
    Client? inner,
  }) = _FlatFieldCorrectionHttp;

  factory FlatFieldCorrectionEndpoint.successMock({
    Client? inner,
  }) = _FlatFieldCorrectionSuccessMock;

  factory FlatFieldCorrectionEndpoint.failedMock({
    Client? inner,
  }) = _FlatFieldCorrectionFailedMock;

  Future<void> fetch();
}

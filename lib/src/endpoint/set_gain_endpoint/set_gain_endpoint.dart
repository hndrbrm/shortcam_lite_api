// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'set_gain_library.dart';

abstract interface class SetGainEndpoint {
  factory SetGainEndpoint({
    Client? inner,
  }) = _SetGainHttp;

  factory SetGainEndpoint.http({
    Client? inner,
  }) = _SetGainHttp;

  factory SetGainEndpoint.successMock({
    Client? inner,
  }) = _SetGainSuccessMock;

  factory SetGainEndpoint.failedMock({
    Client? inner,
  }) = _SetGainFailedMock;

  Future<void> fetch(DeviceGain deviceGain);
}

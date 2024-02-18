// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'get_gain_library.dart';

abstract interface class GetGainEndpoint {
  factory GetGainEndpoint({
    Client? inner,
  }) = _GetGainHttp;

  factory GetGainEndpoint.http({
    Client? inner,
  }) = _GetGainHttp;

  factory GetGainEndpoint.successMock({
    Client? inner,
  }) = _GetGainSuccessMock;

  factory GetGainEndpoint.failedMock({
    Client? inner,
  }) = _GetGainFailedMock;

  Future<DeviceGain> fetch();
}

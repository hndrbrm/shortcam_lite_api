// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'guogai_calibrate_library.dart';

abstract interface class GuogaiCalibrateEndpoint {
  factory GuogaiCalibrateEndpoint({
    Client? inner,
  }) = _GuogaiCalibrateHttp;

  factory GuogaiCalibrateEndpoint.http({
    Client? inner,
  }) = _GuogaiCalibrateHttp;

  factory GuogaiCalibrateEndpoint.successMock({
    Client? inner,
  }) = _GuogaiCalibrateSuccessMock;

  factory GuogaiCalibrateEndpoint.failedMock({
    Client? inner,
  }) = _GuogaiCalibrateFailedMock;

  Future<void> fetch();
}

// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'param_package_check_library.dart';

abstract interface class ParamPackageCheckEndpoint {
  factory ParamPackageCheckEndpoint({
    Client? inner,
  }) = _ParamPackageCheckHttp;

  factory ParamPackageCheckEndpoint.http({
    Client? inner,
  }) = _ParamPackageCheckHttp;

  factory ParamPackageCheckEndpoint.successMock({
    Client? inner,
  }) = _ParamPackageCheckSuccessMock;

  factory ParamPackageCheckEndpoint.failedMock({
    Client? inner,
  }) = _ParamPackageCheckFailedMock;

  Future<ParamPackageCheck> fetch();
}

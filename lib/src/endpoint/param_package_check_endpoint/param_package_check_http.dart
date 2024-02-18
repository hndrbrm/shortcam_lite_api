// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'param_package_check_library.dart';

final class _ParamPackageCheckHttp implements ParamPackageCheckEndpoint {
  const _ParamPackageCheckHttp({
    Client? inner,
  })
  : _inner = inner;

  final Client? _inner;

  @override
  Future<ParamPackageCheck> fetch() async {
    final client = ShortcamClient<ParamPackageCheck>(
      inner: _inner,
      dataParser: ParamPackageCheck.fromJson,
    );
    final uri = Uri.parse('measurement/paramPackageCheck');
    final paramPackageCheck = await client.getJson(uri);

    return paramPackageCheck!;
  }
}

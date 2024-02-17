// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of '../endpoint.dart';

final class _DeviceInfoSuccessMock extends _DeviceInfoHttp {
  _DeviceInfoSuccessMock({
    Client? inner,
  })
  : super(
    inner: MockedClient(
      responseMocker: () async => Future.delayed(
        const Duration(seconds: 3),
      ).then(
        (_) => Response.bytes(
// Use string representation to reduce IDE analyze script.
'''{
	"data":	{
		"name":	"IRCAM",
		"vendor":	"LC",
		"country":	"China",
		"serial":	"8000E23060499528",
		"mac":	"38-38-38-38-38-38",
		"version":	{
			"firmwareVersion":	"0000_B39_1.0.10",
			"firmwareBuildTime":	"2023-08-11 ",
			"romVersion":	"",
			"romBuildTime":	"",
			"flashVersion":	"",
			"flashBuildTime":	""
		}
	},
	"code":	200,
	"msg":	"Success"
}'''.codeUnits,
          200,
        ),
      ),
    ),
  );
}

final class _DeviceInfoFailedMock extends _DeviceInfoHttp {
  _DeviceInfoFailedMock({
    Client? inner,
  })
  : super(
    inner: MockedClient(
      responseMocker: () async => Future.delayed(
        const Duration(seconds: 3),
      ).then((_) => throw UnimplementedError()),
    ),
  );
}

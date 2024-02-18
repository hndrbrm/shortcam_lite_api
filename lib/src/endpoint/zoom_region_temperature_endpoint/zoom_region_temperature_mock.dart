// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

part of 'zoom_region_temperature_library.dart';

final class _ZoomRegionTemperatureSuccessMock extends _ZoomRegionTemperatureHttp {
  _ZoomRegionTemperatureSuccessMock({
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
		"enable":	false,
		"max":	{
			"value":	null,
			"x":	0,
			"y":	475
		},
		"min":	{
			"value":	null,
			"x":	212,
			"y":	192
		},
		"center":	{
			"value":	null
		},
		"avg":	{
			"value":	null
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

final class _ZoomRegionTemperatureFailedMock extends _ZoomRegionTemperatureHttp {
  _ZoomRegionTemperatureFailedMock({
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

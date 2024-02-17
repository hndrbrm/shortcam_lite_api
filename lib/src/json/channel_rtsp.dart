// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

import '../shareable/json_mixin.dart';
import '../shareable/parser.dart';
import 'device_version.dart';

export 'device_version.dart' show DeviceVersion;

@immutable
abstract base class _Fields with ToJson, JsonToString {
  const _Fields({
    required this.main,
    required this.sub,
  });

  final String main;
  final String sub;
}

final class ChannelRtsp extends _Fields with _Equality, _ToJson {
  const ChannelRtsp({
    required super.main,
    required super.sub,
  });

  ChannelRtsp.fromJson(Map<String, dynamic> json)
  : super(
    main: StringParser.parse(json['rtspUrlMain']),
    sub: StringParser.parse(json['rtspUrlSub']),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is ChannelRtsp &&
    other.main == main &&
    other.sub == sub;

  @override
  int get hashCode => Object.hash(
    main,
    sub,
  );
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    'rtspUrlMain': main,
    'rtspUrlSub': sub,
  };
}

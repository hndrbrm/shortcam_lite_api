// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';

import '../shareable/json_mixin.dart';
import '../shareable/parser.dart';
import 'region.dart';

export 'region.dart' show Region;

@immutable
abstract base class _Fields with ToJson, JsonToString {
  const _Fields({
    bool? regionEnable,
    Region? region,
  })
  : regionEnable = regionEnable ?? false,
    region = region ?? const Region();

  final bool regionEnable;
  final Region region;
}

final class ZoomRegion extends _Fields with _Equality, _ToJson {
  const ZoomRegion({
    super.regionEnable,
    super.region,
  });

  ZoomRegion.fromJson(Map<String, dynamic> json)
  : super(
    regionEnable: BoolParser.tryParse(json['regionEnable']),
    region: Region.fromJson(json['region']),
  );
}

base mixin _Equality on _Fields {
  @override
  bool operator ==(Object other) =>
    other is ZoomRegion &&
    other.regionEnable == regionEnable &&
    other.region == region;

  @override
  int get hashCode => Object.hash(
    regionEnable,
    region,
  );
}

base mixin _ToJson on _Fields {
  @override
  Map<String, dynamic> toJson() => {
    'regionEnable': regionEnable,
    'region': region.toJson(),
  };
}

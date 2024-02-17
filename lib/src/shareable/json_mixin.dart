// Copyright 2024. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

abstract mixin class ToJson {
  dynamic toJson();
}

base mixin JsonToString on ToJson {
  @override
  String toString() => toJson().toString();
}

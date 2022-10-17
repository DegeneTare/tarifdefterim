import 'dart:ffi';

import 'package:flutter/material.dart';

enum foodsQueries { Sort }

extension foodsQueriesExtension on foodsQueries {
  MapEntry<String, String> toMapEntry(String value) {
    switch (this) {
      case foodsQueries.Sort:
        return MapEntry('_order', value);
    }
  }
}

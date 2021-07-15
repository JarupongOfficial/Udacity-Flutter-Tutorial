import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'unit.dart';
// import 'converter_route.dart';

class Category {
  final String? name;
  final ColorSwatch? color;
  final String? iconLocation;
  final List<Unit>? units;

  const Category({
    this.name,
    this.color,
    this.iconLocation,
    this.units,
  });
}

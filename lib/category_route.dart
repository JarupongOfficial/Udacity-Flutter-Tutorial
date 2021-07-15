import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'unit.dart';
import 'category.dart';
import 'backdrop.dart';
import 'unit_converter.dart';
import 'category_tile.dart';

// final _backgroundColor = Colors.green[100];

class CategoryRoute extends StatefulWidget {
  const CategoryRoute();

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  Category _defaultCategory = Category(
      name: 'Length',
      color: ColorSwatch(0xFF6AB7A8, {
        'highlight': Color(0xFF6AB7A8),
        'splash': Color(0xFF0ABC9B),
      }),
      iconLocation: Icons.cake,
      units: <Unit>[]);

  Category _currentCategory = Category(
      name: 'Length',
      color: ColorSwatch(0xFF6AB7A8, {
        'highlight': Color(0xFF6AB7A8),
        'splash': Color(0xFF0ABC9B),
      }),
      iconLocation: Icons.cake,
      units: <Unit>[]);

  final _categories = <Category>[];

  static const _baseColors = <ColorSwatch>[
    ColorSwatch(0xFF6AB7A8, {
      'highlight': Color(0xFF6AB7A8),
      'splash': Color(0xFF0ABC9B),
    }),
    ColorSwatch(0xFFFFD28E, {
      'highlight': Color(0xFFFFD28E),
      'splash': Color(0xFFFFA41C),
    }),
    ColorSwatch(0xFFFFB7DE, {
      'highlight': Color(0xFFFFB7DE),
      'splash': Color(0xFFF94CBF),
    }),
    ColorSwatch(0xFF8899A8, {
      'highlight': Color(0xFF8899A8),
      'splash': Color(0xFFA9CAE8),
    }),
    ColorSwatch(0xFFEAD37E, {
      'highlight': Color(0xFFEAD37E),
      'splash': Color(0xFFFFE070),
    }),
    ColorSwatch(0xFF81A56F, {
      'highlight': Color(0xFF81A56F),
      'splash': Color(0xFF7CC159),
    }),
    ColorSwatch(0xFFD7C0E2, {
      'highlight': Color(0xFFD7C0E2),
      'splash': Color(0xFFCA90E5),
    }),
    ColorSwatch(0xFFCE9A9A, {
      'highlight': Color(0xFFCE9A9A),
      'splash': Color(0xFFF94D56),
      'error': Color(0xFF912D2D),
    }),
  ];


  // @override
  // void initState() {
  //   super.initState();
  //   for (var i = 0; i < _categoryNames.length; i++) {
  //     var category = Category(
  //       name: _categoryNames[i],
  //       color: _baseColors[i],
  //       iconLocation: Icons.cake,
  //       units: _retrieveUnitList(_categoryNames[i]),
  //     );
  //     if (i == 0) {
  //       _defaultCategory = category;
  //     }
  //     _categories.add(category);
  //   }
  // }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (_categories.isEmpty) {
      await _retrieveLocalCategories();
    }
  }

  Future<void> _retrieveLocalCategories() async {
    final json = DefaultAssetBundle.of(context)
        .loadString('assets/data/regular_units.json');
    final data = JsonDecoder().convert(await json);
    if (data is! Map) {
      throw ('Data retrieved from API is not Map');
    }
    var categoryIndex = 0;
    data.keys.forEach((key) {
      final List<Unit> units =
      data[key].map<Unit>((dynamic data) => Unit.fromJson(data)).toList();

      var category = Category(
          name: key,
          color: _baseColors[categoryIndex],
          iconLocation: Icons.cake,
          units: units,
      );

      setState(() {
        if(categoryIndex == 0){
          _defaultCategory = category;
        }
        _categories.add(category);
      });
      categoryIndex += 1;
    });
  }

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  Widget _buildCategoryWidgets(Orientation deviceOrientation) {
    if (deviceOrientation == Orientation.portrait) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return CategoryTile(
            category: _categories[index],
            onTap: _onCategoryTap,
          );
        },
        itemCount: _categories.length,
      );
    } else {
      return GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 3.0,
          children: _categories.map((Category c) {
            return CategoryTile(
              category: c,
              onTap: _onCategoryTap,
            );
          }).toList());
    }
  }

  // List<Unit> _retrieveUnitList(String categoryName) {
  //   return List.generate(10, (int i) {
  //     i += 1;
  //     return Unit(
  //       name: '$categoryName Unit $i',
  //       conversion: i.toDouble(),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    if(_categories.isEmpty){
      return Center(
        child: Container(
          height: 180.0,
          width: 180.0,
          child: CircularProgressIndicator(),
        ),
      );
    }

    assert(debugCheckHasMediaQuery(context));
    final listView = Padding(
      padding: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 48.0,
      ),
      child: _buildCategoryWidgets(MediaQuery.of(context).orientation),
    );

    return Backdrop(
      currentCategory:
          _currentCategory == null ? _defaultCategory : _currentCategory,
      frontPanel: _currentCategory == null
          ? UnitConverter(category: _defaultCategory)
          : UnitConverter(category: _currentCategory),
      backPanel: listView,
      frontTitle: Text('Unit Converter'),
      backTitle: Text('Select a Category'),
    );
  }
}

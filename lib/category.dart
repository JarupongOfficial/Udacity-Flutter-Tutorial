import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'unit.dart';
// import 'converter_route.dart';

// final _rowHeight = 100.0;
// final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  const Category({
    required this.name,
    required this.color,
    required this.iconLocation,
    required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null);

// void _navigateToConverter(BuildContext context) {
//   Navigator.of(context)
//       .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1.0,
//         title: Text(
//           name,
//           style: Theme.of(context).textTheme.headline4,
//         ),
//         centerTitle: true,
//         backgroundColor: color,
//       ),
//       body: ConverterRoute(
//         color: color,
//         units: units,
//       ),
//       resizeToAvoidBottomInset: false,
//     );
//   }));
// }
//
// @override
// Widget build(BuildContext context) {
//   return Material(
//     color: Colors.transparent,
//     child: Container(
//       // color: Colors.blueAccent,
//       height: _rowHeight,
//       child: InkWell(
//         borderRadius: _borderRadius,
//         highlightColor: color['highlight'],
//         splashColor: color['splash'],
//         onTap: () => _navigateToConverter(context),
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(right: 16.0),
//                 child: Icon(
//                   iconLocation,
//                   size: 60.0,
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   name,
//                   style: Theme.of(context).textTheme.headline4,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
}

// // Copyright 2018 The Chromium Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Hello Rectangle',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Hello Rectangle'),
//         ),
//         body: HelloRectangle(),
//       ),
//     ),
//   );
// }
//
// class HelloRectangle extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         color: Colors.greenAccent,
//         height: 400.0,
//         width: 300.0,
//         child: Center(
//           child: Text(
//             'Hello!',
//             style: TextStyle(fontSize: 40.0),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// void main() {
//   print("Hello");
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text("Hello Rectangle"),
//           ),
//           body: HelloRectangle()),
//     ),
//   );
// }
//
// class HelloRectangle extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         color: Colors.greenAccent,
//         height: 400,
//         width: 300,
//         child: Center(
//           child: Text(
//             "Hello",
//             style: TextStyle(fontSize: 40.0),
//           ),
//         ),
//       ),
//     );
//   }
// }

//------------------------------------------------------------------
// import 'package:flutter/material.dart';
//
// import 'unit.dart';
// import 'category.dart';
// import 'backdrop.dart';
// import 'unit_converter.dart';
// import 'category_tile.dart';
//
// // final _backgroundColor = Colors.green[100];
//
// class CategoryRoute extends StatefulWidget {
//   const CategoryRoute();
//
//   @override
//   _CategoryRouteState createState() => _CategoryRouteState();
// }
//
// class _CategoryRouteState extends State<CategoryRoute> {
//   late Category _defaultCategory;
//   late Category _currentCategory;
//   final _categories = <Category>[];
//
//   static const _categoryNames = <String>[
//     'Length',
//     'Area',
//     'Volume',
//     'Mass',
//     'Time',
//     'Digital Storage',
//     'Energy',
//     'Currency',
//   ];
//
//   static const _baseColors = <ColorSwatch>[
//     ColorSwatch(0xFF6AB7A8, {
//       'highlight': Color(0xFF6AB7A8),
//       'splash': Color(0xFF0ABC9B),
//     }),
//     ColorSwatch(0xFFFFD28E, {
//       'highlight': Color(0xFFFFD28E),
//       'splash': Color(0xFFFFA41C),
//     }),
//     ColorSwatch(0xFFFFB7DE, {
//       'highlight': Color(0xFFFFB7DE),
//       'splash': Color(0xFFF94CBF),
//     }),
//     ColorSwatch(0xFF8899A8, {
//       'highlight': Color(0xFF8899A8),
//       'splash': Color(0xFFA9CAE8),
//     }),
//     ColorSwatch(0xFFEAD37E, {
//       'highlight': Color(0xFFEAD37E),
//       'splash': Color(0xFFFFE070),
//     }),
//     ColorSwatch(0xFF81A56F, {
//       'highlight': Color(0xFF81A56F),
//       'splash': Color(0xFF7CC159),
//     }),
//     ColorSwatch(0xFFD7C0E2, {
//       'highlight': Color(0xFFD7C0E2),
//       'splash': Color(0xFFCA90E5),
//     }),
//     ColorSwatch(0xFFCE9A9A, {
//       'highlight': Color(0xFFCE9A9A),
//       'splash': Color(0xFFF94D56),
//       'error': Color(0xFF912D2D),
//     }),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     for (var i = 0; i < _categoryNames.length; i++) {
//       var category = Category(
//         name: _categoryNames[i],
//         color: _baseColors[i],
//         iconLocation: Icons.cake,
//         units: _retrieveUnitList(_categoryNames[i]),
//       );
//       if (i == 0) {
//         _defaultCategory = category;
//       }
//       _categories.add(category);
//     }
//   }
//
//   void _onCategoryTap(Category category) {
//     setState(() {
//       _currentCategory = category;
//     });
//   }
//
//   Widget _buildCategoryWidgets() {
//     return ListView.builder(
//       itemBuilder: (BuildContext context, int index) {
//         return CategoryTile(
//           category: _categories[index],
//           onTap: _onCategoryTap,
//         );
//       },
//       itemCount: _categories.length,
//     );
//   }
//
//   List<Unit> _retrieveUnitList(String categoryName) {
//     return List.generate(10, (int i) {
//       i += 1;
//       return Unit(
//         name: '$categoryName Unit $i',
//         conversion: i.toDouble(),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // final categories = <CategoryList>[];
//     //
//     // for (var i = 0; i < _categoryNames.length; i++) {
//     //   categories.add(CategoryList(
//     //     name: _categoryNames[i],
//     //     color: _baseColors[i],
//     //     iconLocation: Icons.cake,
//     //     units: _retrieveUnitList(_categoryNames[i]),
//     //   ));
//     // }
//     // final listView = Container(
//     //   color: _backgroundColor,
//     //   padding: EdgeInsets.symmetric(horizontal: 8.0),
//     //   child: _buildCategoryWidgets(),
//     // );
//     //
//     // final appBar = AppBar(
//     //   elevation: 0.0,
//     //   title: Text(
//     //     'Unit Converter',
//     //     style: TextStyle(color: Colors.black, fontSize: 30.0),
//     //   ),
//     //   centerTitle: true,
//     //   backgroundColor: Colors.green,
//     // );
//     //
//     // return Scaffold(
//     //   appBar: appBar,
//     //   body: listView,
//     // );
//     final listView = Padding(
//       padding: EdgeInsets.only(
//         left: 8.0,
//         right: 8.0,
//         bottom: 48.0,
//       ),
//       child: _buildCategoryWidgets(),
//     );
//
//     return Backdrop(
//       currentCategory:
//       _currentCategory == null ? _defaultCategory : _currentCategory,
//       frontPanel: _currentCategory == null
//           ? UnitConverter(category: _defaultCategory)
//           : UnitConverter(category: _currentCategory),
//       backPanel: listView,
//       frontTitle: Text('Unit Converter'),
//       backTitle: Text('Select a Category'),
//     );
//   }
// }

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// import 'dart:math' as math;
//
// import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';
//
// import 'category.dart';
//
// const double _kFlingVelocity = 2.0;
//
// class _BackdropPanel extends StatelessWidget {
//   const _BackdropPanel({
//     Key? key,
//     required this.onTap,
//     required this.onVerticalDragUpdate,
//     required this.onVerticalDragEnd,
//     required this.title,
//     required this.child,
//   }) : super(key: key);
//
//   final VoidCallback onTap;
//   final GestureDragUpdateCallback onVerticalDragUpdate;
//   final GestureDragEndCallback onVerticalDragEnd;
//   final Widget title;
//   final Widget child;
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 2.0,
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(16.0),
//         topRight: Radius.circular(16.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           GestureDetector(
//             behavior: HitTestBehavior.opaque,
//             onVerticalDragUpdate: onVerticalDragUpdate,
//             onVerticalDragEnd: onVerticalDragEnd,
//             onTap: onTap,
//             child: Container(
//               height: 48.0,
//               padding: EdgeInsetsDirectional.only(start: 16.0),
//               alignment: AlignmentDirectional.centerStart,
//               child: DefaultTextStyle(
//                 style: TextStyle(fontSize: 42, color: Colors.blue),
//                 child: title,
//               ),
//             ),
//           ),
//           Divider(
//             height: 1.0,
//           ),
//           Expanded(child: child),
//         ],
//       ),
//     );
//   }
// }
//
// class _BackdropTitle extends AnimatedWidget {
//   final Widget frontTitle;
//   final Widget backTitle;
//
//   const _BackdropTitle({
//     Key? key,
//     required Listenable listenable,
//     required this.frontTitle,
//     required this.backTitle,
//   }) : super(key: key, listenable: listenable);
//
//   @override
//   Widget build(BuildContext context) {
//     final animation = listenable as Animation<double>;
//     return DefaultTextStyle(
//       style: TextStyle(fontSize: 42, color: Colors.blue),
//       softWrap: false,
//       overflow: TextOverflow.ellipsis,
//       child: Stack(
//         children: [
//           Opacity(
//             opacity: CurvedAnimation(
//               parent: ReverseAnimation(animation),
//               curve: Interval(0.5, 1.0),
//             ).value,
//             child: backTitle,
//           ),
//           Opacity(
//             opacity: CurvedAnimation(
//               parent: animation,
//               curve: Interval(0.5, 1.0),
//             ).value,
//             child: frontTitle,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Backdrop extends StatefulWidget {
//   final Category currentCategory;
//   final Widget frontPanel;
//   final Widget backPanel;
//   final Widget frontTitle;
//   final Widget backTitle;
//
//   const Backdrop({
//     required this.currentCategory,
//     required this.frontPanel,
//     required this.backPanel,
//     required this.frontTitle,
//     required this.backTitle,
//   })  : assert(currentCategory != null),
//         assert(frontPanel != null),
//         assert(backPanel != null),
//         assert(frontTitle != null),
//         assert(backTitle != null);
//
//   @override
//   _BackdropState createState() => _BackdropState();
// }
//
// class _BackdropState extends State<Backdrop>
//     with SingleTickerProviderStateMixin {
//   final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       value: 1.0,
//       vsync: this,
//     );
//   }
//
//   @override
//   void didUpdateWidget(Backdrop old) {
//     super.didUpdateWidget(old);
//     if (widget.currentCategory != old.currentCategory) {
//       setState(() {
//         _controller.fling(
//             velocity:
//             _backdropPanelVisible ? -_kFlingVelocity : _kFlingVelocity);
//       });
//     } else if (!_backdropPanelVisible) {
//       setState(() {
//         _controller.fling(velocity: _kFlingVelocity);
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   bool get _backdropPanelVisible {
//     final AnimationStatus status = _controller.status;
//     return status == AnimationStatus.completed ||
//         status == AnimationStatus.forward;
//   }
//
//   void _toggleBackdropPanelVisibility() {
//     FocusScope.of(context).requestFocus(FocusNode());
//     _controller.fling(
//         velocity: _backdropPanelVisible ? -_kFlingVelocity : _kFlingVelocity);
//   }
//
//   double get _backdropHeight {
//     final RenderBox renderBox =
//     _backdropKey.currentContext!.findRenderObject() as RenderBox;
//     return renderBox.size.height;
//   }
//
//   void _handleDragUpdate(DragUpdateDetails details) {
//     if (_controller.isAnimating ||
//         _controller.status == AnimationStatus.completed) return;
//     _controller.value -= details.primaryDelta! / _backdropHeight;
//   }
//
//   void _handleDragEnd(DragEndDetails details) {
//     if (_controller.isAnimating ||
//         _controller.status == AnimationStatus.completed) return;
//     final double flingVelocity =
//         details.velocity.pixelsPerSecond.dy / _backdropHeight;
//     if (flingVelocity < 0.0)
//       _controller.fling(velocity: math.max(_kFlingVelocity, -flingVelocity));
//     else if (flingVelocity > 0)
//       _controller.fling(velocity: math.min(-_kFlingVelocity, -flingVelocity));
//     else
//       _controller.fling(
//           velocity:
//           _controller.value < 0.5 ? -_kFlingVelocity : _kFlingVelocity);
//   }
//
//   Widget _buildStack(BuildContext context, BoxConstraints constraints) {
//     const double panelTitleHeight = 48.0;
//     final Size panelSize = constraints.biggest;
//     final double panelTop = panelSize.height - panelTitleHeight;
//
//     Animation<RelativeRect> panelAnimation = RelativeRectTween(
//       begin: RelativeRect.fromLTRB(0.0, panelTop, 0.0, panelSize.height),
//       end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
//     ).animate(_controller.view);
//
//     return Container(
//       key: _backdropKey,
//       color: widget.currentCategory.color,
//       child: Stack(
//         children: [
//           widget.backPanel,
//           PositionedTransition(
//             rect: panelAnimation,
//             child: _BackdropPanel(
//               onTap: _toggleBackdropPanelVisibility,
//               onVerticalDragUpdate: _handleDragUpdate,
//               onVerticalDragEnd: _handleDragEnd,
//               title: Text(widget.currentCategory.name),
//               child: widget.frontPanel,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: widget.currentCategory.color,
//         elevation: 0.0,
//         leading: IconButton(
//           onPressed: _toggleBackdropPanelVisibility,
//           icon: AnimatedIcon(
//             icon: AnimatedIcons.close_menu,
//             progress: _controller.view,
//           ),
//         ),
//         title: _BackdropTitle(
//           listenable: _controller.view,
//           frontTitle: widget.frontTitle,
//           backTitle: widget.backTitle,
//         ),
//       ),
//       body: LayoutBuilder(
//         builder: _buildStack,
//       ),
//     );
//   }
// }

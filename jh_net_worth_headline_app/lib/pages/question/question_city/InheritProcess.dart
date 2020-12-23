
import 'package:flutter/material.dart';
import 'PickerPopupRoute.dart';

class InheritRouteWidget extends InheritedWidget {
  final CityPickerRoute router;

  InheritRouteWidget({Key key, @required this.router, Widget child})
      : super(key: key, child: child);

  static InheritRouteWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritRouteWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.router != router;
  }
}

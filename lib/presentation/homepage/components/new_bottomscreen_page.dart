import 'package:flutter/material.dart';
class MySalomonBottomBar extends StatefulWidget {
  const MySalomonBottomBar({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedColorOpacity,
    this.itemShape = const StadiumBorder(),
    this.margin = const EdgeInsets.all(8),
    this.itemPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutQuint,
  }) : super(key: key);

  final List<SalomonBottomBarItem> items;
  final int currentIndex;
  final Function(int)? onTap;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? selectedColorOpacity;
  final ShapeBorder itemShape;
  final EdgeInsets margin;
  final EdgeInsets itemPadding;
  final Duration duration;
  final Curve curve;
  @override
  State<MySalomonBottomBar> createState() => _MySalomonBottomBarState();
}

class _MySalomonBottomBarState extends State<MySalomonBottomBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
minimum: widget.margin,
      child: Row(
        mainAxisAlignment: widget.items.length<=2
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.spaceBetween,
        children: [
          for (final item in widget.items)
            TweenAnimationBuilder<double>(
              tween: Tween(
                end:widget.items.indexOf(item) ==widget.currentIndex ? 1.0 : 0.0,
              ),
              curve:widget.curve,
              duration:widget. duration,
              builder: (context, t, _) {
                final _selectedColor = item.selectedColor ??
                   widget. selectedItemColor ??
                    theme.primaryColor;

                final _unselectedColor = item.unselectedColor ??
                  widget.unselectedItemColor ??
                    theme.iconTheme.color;

                return Material(
                  color: Color.lerp(
                      _selectedColor.withOpacity(0.0),
                      _selectedColor.withOpacity(widget.selectedColorOpacity ?? 0.1),
                      t),
                  shape:widget. itemShape,
                  child: InkWell(
                    onTap: () =>widget. onTap?.call(widget.items.indexOf(item)),
                    customBorder:widget. itemShape,
                    focusColor: _selectedColor.withOpacity(0.1),
                    highlightColor: _selectedColor.withOpacity(0.1),
                    splashColor: _selectedColor.withOpacity(0.1),
                    hoverColor: _selectedColor.withOpacity(0.1),
                    child: Padding(
                      padding:widget. itemPadding -
                          (Directionality.of(context) == TextDirection.ltr
                              ? EdgeInsets.only(right:widget. itemPadding.right * t)
                              : EdgeInsets.only(left:widget. itemPadding.left * t)),
                      child: Row(
                        children: [
                          IconTheme(
                            data: IconThemeData(
                              color: Color.lerp(
                                  _unselectedColor, _selectedColor, t),
                              size: 24,
                            ),
                            child:widget. items.indexOf(item) ==widget. currentIndex
                                ? item.activeIcon ?? item.icon
                                : item.icon,
                          ),
                          ClipRect(
                            clipBehavior: Clip.antiAlias,
                            child: SizedBox(
                              height: 20,
                              child: Align(
                                alignment: Alignment(-0.2, 0.0),
                                widthFactor: t,
                                child: Padding(
                                  padding: Directionality.of(context) ==
                                      TextDirection.ltr
                                      ? EdgeInsets.only(
                                      left:widget. itemPadding.left / 2,
                                      right:widget. itemPadding.right)
                                      : EdgeInsets.only(
                                      left:widget. itemPadding.left,
                                      right:widget. itemPadding.right / 2),
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                      color: Color.lerp(
                                          _selectedColor.withOpacity(0.0),
                                          _selectedColor,
                                          t),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    child: item.title,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
class SalomonBottomBarItem {

  final Widget icon;
  final Widget? activeIcon;
  final Widget title;
  final Color? selectedColor;
  final Color? unselectedColor;

  SalomonBottomBarItem({
    required this.icon,
    required this.title,
    this.selectedColor,
    this.unselectedColor,
    this.activeIcon,
  });
}


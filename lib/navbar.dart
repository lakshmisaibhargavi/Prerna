import 'package:flutter/material.dart';

class DotNavigationBar extends StatelessWidget {
  DotNavigationBar({
    Key key,
    this.items,
    this.currentIndex = 0,
    this.onTap,
    this.margin = const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    this.itemPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOutQuint,
    this.dotIndicatorColor,
  }) : super(key: key);
  final List<DotNavigationBarItem> items;

  final int currentIndex;

  final Function(int) onTap;

  final EdgeInsets margin;
  final EdgeInsets itemPadding;
  final Duration duration;
  final Curve curve;
  final Color dotIndicatorColor;

  @override
  Widget build(BuildContext context) {
    print(currentIndex);
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 60,
          color: Colors.white,
        ),
        Container(
          height: 150,
          padding: EdgeInsets.symmetric(vertical: 12),
          color: Colors.transparent,
          child: Padding(
            padding: margin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (final item in items)
                  TweenAnimationBuilder<double>(
                    tween: Tween(
                      end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
                    ),
                    curve: curve,
                    duration: duration,
                    builder: (context, t, _) {
                      return Material(
                        color: Color.lerp(
                            Colors.transparent, Colors.transparent, t),
                        child: InkWell(
                          onTap: () => onTap?.call(items.indexOf(item)),
                          child: Stack(children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 20, bottom: 25),
                              child: Row(
                                children: [
                                  Image.asset(
                                    '${item.icon}',
                                    height: 120,
                                    width: 70,
                                  ),
                                ],
                              ),
                            ),
                            ClipRect(
                              child: SizedBox(
                                height: 100,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  widthFactor: t,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: itemPadding.right / 0.55,
                                        right: itemPadding.right),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                        color: Color.lerp(
                                            Colors.black.withOpacity(0.0),
                                            Colors.black,
                                            t),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      child: CircleAvatar(
                                          radius: 3.5,
                                          backgroundColor: dotIndicatorColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -2,
                              left: 10,
                              child: Center(
                                child: Text(
                                  "${item.name}",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// A tab to display in a [DotNavigationBar]
class DotNavigationBarItem {
  /// An icon to display.
  final String icon;
  final String name;

  /// A primary color to use for this tab.

  DotNavigationBarItem({this.icon, this.name})
      : assert(icon != null, "Every DotNavigationBarItem requires an icon.");
}

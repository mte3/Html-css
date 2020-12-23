import 'package:flutter/material.dart';

/// 封装AppBar
///
///
class NavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const NavigationBar({
    this.title = '',
    this.showBackIcon = true,
    this.rightDMActions,
    this.backgroundColor = const Color(0xffffffff),
    this.mainColor = Colors.black,
    this.titleW,
    this.bottom,
    this.leading,
    this.isCenterTitle = true,
    this.iconColor = const Color(0xffdcba76),
    this.brightness = Brightness.dark,
    this.automaticallyImplyLeading = true,
    this.icons = Icons.arrow_back_ios,
  });

  final String title;
  final bool showBackIcon;
  final List<Widget> rightDMActions;
  final Color backgroundColor;
  final Color mainColor;
  final Widget titleW;
  final PreferredSizeWidget bottom;
  final Widget leading;
  final bool isCenterTitle;
  final Color iconColor;
  final Brightness brightness;
  final bool automaticallyImplyLeading;
  final IconData icons;

  @override
  Size get preferredSize => new Size(100, bottom != null ? 100 : 48);

  @override
  Widget build(BuildContext context) {
    return new AppBar(
      title: titleW == null
          ? new Text(
              title,
              style: new TextStyle(color: mainColor),
            )
          : titleW,
      backgroundColor: backgroundColor,
      elevation: 0.0,
      brightness: brightness,
      leading: leading == null
          ? showBackIcon
              ? Navigator.canPop(context)
                  ? new InkWell(
                      child: new Container(
                        width: 60,
                        height: 28,
                        margin: EdgeInsets.symmetric(vertical: 13),
                        child:
                            Image.asset('assets/icons/question/icon_back.png'),
                      ),
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        Navigator.maybePop(context);
                      },
                    )
                  : null
              : null
          : leading,
      centerTitle: isCenterTitle,
      bottom: bottom != null ? bottom : null,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: rightDMActions ?? [new Center()],
    );
  }
}

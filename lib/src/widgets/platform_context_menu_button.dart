import 'package:flutter/material.dart';
import 'package:lichess_mobile/src/widgets/buttons.dart';

/// A platform agnostic context menu button.
///
/// Typically used in the [AppBar] to show a context menu.
class PlatformContextMenuButton extends StatelessWidget {
  const PlatformContextMenuButton({
    required this.icon,
    required this.semanticsLabel,
    required this.actions,
    super.key,
  });

  final Widget icon;
  final String semanticsLabel;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      crossAxisUnconstrained: false,
      consumeOutsideTap: true,
      style: MenuStyle(
        maximumSize: WidgetStatePropertyAll(
          Size(MediaQuery.sizeOf(context).width * 0.6, MediaQuery.sizeOf(context).height * 0.8),
        ),
      ),
      menuChildren: actions,
      builder: (BuildContext context, MenuController controller, Widget? child) {
        return AppBarIconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          semanticsLabel: semanticsLabel,
          icon: icon,
        );
      },
    );
  }
}

class PlatformContextMenuAction extends StatelessWidget {
  const PlatformContextMenuAction({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.dismissOnPress = true,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  /// Whether the modal should be dismissed when an action is pressed.
  ///
  /// Default to true.
  final bool dismissOnPress;

  @override
  Widget build(BuildContext context) {
    return MenuItemButton(
      closeOnActivate: dismissOnPress,
      leadingIcon: Icon(icon),
      semanticsLabel: label,
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

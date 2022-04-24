import 'package:flutter/material.dart';

import '../../utils/app_text_style.dart';

/// common base app bar for whole application
///
/// implement [PreferredSizeWidget] so that it can be placed at
/// [AppBar] in any scaffold screen
///
/// [PreferredSizeWidget] has preferredSize to set app-bar global size
class BaseAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppbar({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      title: Text(
        title ?? '',
        style: AppTextStyle.poppins(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

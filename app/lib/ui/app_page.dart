import 'package:flutter/material.dart';

import 'app_sizes.dart';
import 'app_spacing.dart';

class AppPage extends StatelessWidget {
  const AppPage({
    required this.child,
    this.title,
    this.actions = const [],
    this.scrollable = true,
    super.key,
  });

  final Widget child;
  final String? title;
  final List<Widget> actions;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    final content = Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppSizes.contentWidth),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: child,
        ),
      ),
    );
    return Scaffold(
      appBar: title == null && actions.isEmpty
          ? null
          : AppBar(
              title: title == null ? null : Text(title),
              actions: actions,
            ),
      body: SafeArea(
        child: scrollable ? SingleChildScrollView(child: content) : content,
      ),
    );
  }
}

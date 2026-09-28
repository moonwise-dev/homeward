import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';

class GalleryParameterRow extends StatelessWidget {
  const GalleryParameterRow({required this.parameter, super.key});

  final ComponentParameter parameter;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final path = parameter.path;
    final seededBy = parameter.seededBy;
    final description = parameter.description;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: AppSpacing.xs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(parameter.name, style: styles.code),
              Text(
                [
                  _kindText(parameter.kind),
                  parameter.required ? 'required' : 'optional',
                ].join(', '),
                style: styles.caption,
              ),
            ],
          ),
          if (path != null)
            Text(
              [
                '${parameter.kind == ParameterKind.input ? 'Writes' : 'Binds'} '
                    '$path',
                if (seededBy != null) 'seeded by $seededBy',
              ].join(', '),
              style: styles.caption.copyWith(color: colors.accent),
            ),
          if (parameter.choices.isNotEmpty)
            Text(
              'One of ${parameter.choices.join(', ')}',
              style: styles.caption,
            ),
          if (description != null) Text(description, style: styles.caption),
        ],
      ),
    );
  }

  static String _kindText(ParameterKind kind) => switch (kind) {
    ParameterKind.binding => 'bound to a tool\'s data',
    ParameterKind.input => 'a path the block writes',
    ParameterKind.action => 'an action',
    ParameterKind.text => 'text',
    ParameterKind.number => 'a number',
    ParameterKind.flag => 'yes or no',
    ParameterKind.choice => 'a choice',
    ParameterKind.list => 'a list',
  };
}

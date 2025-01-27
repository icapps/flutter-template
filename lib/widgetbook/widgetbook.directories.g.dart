// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_template/widgetbook/widgetbook_widgets/use_cases.dart'
    as _i2;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'widget',
    children: [
      _i1.WidgetbookFolder(
        name: 'library',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'FlutterTemplateBackButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i2.backButton,
            ),
          ),
          _i1.WidgetbookComponent(
            name: 'FlutterTemplateButton',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i2.button,
              ),
              _i1.WidgetbookUseCase(
                name: 'Text',
                builder: _i2.textButton,
              ),
            ],
          ),
          _i1.WidgetbookLeafComponent(
            name: 'FlutterTemplateCheckBox',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i2.checkBox,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'FlutterTemplateProgressIndicator',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i2.progressIndicator,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'FlutterTemplateSwitch',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i2.switchWidget,
            ),
          ),
        ],
      )
    ],
  )
];

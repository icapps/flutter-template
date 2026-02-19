// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_template/widgetbook/widgetbook_widgets/use_cases.dart'
    as _flutter_template_widgetbook_widgetbook_widgets_use_cases;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'widget',
    children: [
      _widgetbook.WidgetbookLeafComponent(
        name: 'Icon',
        useCase: _widgetbook.WidgetbookUseCase(
          name: 'Default',
          builder:
              _flutter_template_widgetbook_widgetbook_widgets_use_cases.icons,
        ),
      ),
      _widgetbook.WidgetbookFolder(
        name: 'library',
        children: [
          _widgetbook.WidgetbookLeafComponent(
            name: 'FlutterTemplateBackButton',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder: _flutter_template_widgetbook_widgetbook_widgets_use_cases
                  .backButton,
            ),
          ),
          _widgetbook.WidgetbookComponent(
            name: 'FlutterTemplateButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder:
                    _flutter_template_widgetbook_widgetbook_widgets_use_cases
                        .button,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Text',
                builder:
                    _flutter_template_widgetbook_widgetbook_widgets_use_cases
                        .textButton,
              ),
            ],
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'FlutterTemplateCheckBox',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder: _flutter_template_widgetbook_widgetbook_widgets_use_cases
                  .checkBox,
            ),
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'FlutterTemplateProgressIndicator',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder: _flutter_template_widgetbook_widgetbook_widgets_use_cases
                  .progressIndicator,
            ),
          ),
          _widgetbook.WidgetbookLeafComponent(
            name: 'FlutterTemplateSwitch',
            useCase: _widgetbook.WidgetbookUseCase(
              name: 'Default',
              builder: _flutter_template_widgetbook_widgetbook_widgets_use_cases
                  .switchWidget,
            ),
          ),
        ],
      ),
    ],
  )
];

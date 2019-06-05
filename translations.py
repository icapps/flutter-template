#!/usr/bin/env python3

import urllib.request
import json

baseUrl = "https://translations.icapps.com/api/translations/"
apiToken = "" // todo add api token
languages = ['en'] // todo add languages
defaultLanguage = 'en'
packageTarget = 'util/locale/'
projectName = "flutter_template" // todo replace project name

headers = {'Authorization': 'Token token='+apiToken}
packageTarget = 'util/locale/'
targetDir = 'lib/' + packageTarget
languagesTargetDir = targetDir + 'translations/'
localizationInterfaceFile = targetDir + 'localization.dart'


def writeHeader(file):
    file.write("/*\n")
    file.write(" * AUTO-GENERATED FILE - DO NOT EDIT\n")
    file.write(" */\n")

def writeStrings(file, translations):
    file.write("const {} = ".format(language) +  "{\n")
    for key, value in translations.items():
        file.write("  '{}': \"{}\",\n".format(key, value.replace("\r\n", "\\n")))
    file.write("};\n")

def writeInterfaceHeader(file):
    file.write("import 'dart:ui';\n\n")

    for language in languages:
        file.write("import 'package:{}/{}translations/{}.dart';\n".format(projectName, packageTarget, language))
    file.write("import 'package:flutter/widgets.dart';\n")
    file.write('\n/*\n')
    file.write(" * AUTO-GENERATED FILE - DO NOT EDIT\n")
    file.write(" */\n")
    file.write("class Localization {\n")
    file.write("  static const List<Locale> supportedLanguages = [\n")
    for language in languages:
        file.write("    Locale('{}'),\n".format(language))
    file.write("  ];\n\n")
    file.write("  static const _defaultLanguage = '{}';\n\n".format(defaultLanguage))
    file.write("  final Locale locale;\n\n")
    file.write("  Localization(this.locale);\n\n")
    file.write("  static Localization of(BuildContext context) => Localizations.of<Localization>(context, Localization);\n\n")
    file.write("  // ignore: prefer_constructors_over_static_methods\n")
    file.write("  static Localization ofLanguage(String language) => Localization(Locale(language));\n\n")
    file.write("  static final Map<String, Map<String, String>> _localizedValues = {\n")
    for language in languages:
        file.write("    '{}': {},\n".format(language, language))
    file.write("  };\n\n")
    file.write("  String _t(String key) {\n")
    file.write("    Map<String, String> _values;\n")
    file.write("    if (_localizedValues.containsKey(locale.languageCode)) {\n")
    file.write("      _values = _localizedValues[locale.languageCode];\n")
    file.write("    } else {\n")
    file.write("      _values = _localizedValues[_defaultLanguage];\n")
    file.write("    }\n")
    file.write("    final value = _values[key];\n")
    file.write("    if (value == null) return '⚠$key⚠';\n")
    file.write("    return value;\n")
    file.write("  }\n")

def writeTranslationFunctions(file, translations):
    for key in translations.keys():
        parts = key.split("_")
        c = 0
        name = ""
        for part in parts:
            if c != 0:
                name = name + part.capitalize()
            else:
                name = part
            c += 1
        file.write("\n  String get {} => _t('{}');\n".format(name, key))

def writeInterfaceFooter(file):
    file.write("}\n")

for language in languages:
    print(f'Updating {language}...', end='')
    url = baseUrl + language + ".json"
    request = urllib.request.Request(url, headers=headers)
    data = urllib.request.urlopen(request)
    jsonData = json.load(data)
    stringsFile = open(languagesTargetDir+language+'.dart', 'w+')
    writeHeader(stringsFile)
    writeStrings(stringsFile, jsonData['translations'])
    stringsFile.close()

    interfaceFile = open(localizationInterfaceFile, "w+")
    writeInterfaceHeader(interfaceFile)
    writeTranslationFunctions(interfaceFile, jsonData['translations'])
    writeInterfaceFooter(interfaceFile)
    interfaceFile.close()
    print(' Done!')

print("Translations successfully updated")
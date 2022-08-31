import 'dart:io';

import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';

class PubspecNameException implements Exception {}

Future run(HookContext context) async {
  final directory = Directory.current.path;
  final logger = context.logger;
  List<String> directories;

  try {
    if (Platform.isWindows) {
      directories = directory.split(r'\').toList();
    } else {
      directories = directory.split('/').toList();
    }

    if (directories.last != 'lib') {
      throw RangeError("Is not the lib directory");
    }

    final libIndex = directories.indexWhere((folder) => folder == 'lib');

    final pubSpecFile =
        File('${directories.sublist(0, libIndex).join('/')}/pubspec.yaml');
    final content = await pubSpecFile.readAsString();
    final yamlMap = loadYaml(content);
    final packageName = yamlMap['name'];

    if (packageName == null) {
      throw PubspecNameException();
    }

    context.vars = {
      ...context.vars,
      'package_name': packageName,
    };
  } on RangeError catch (_) {
    logger.alert(backgroundDefault.wrap(styleBold.wrap(red.wrap(
        '---------------------------------------------------------------------'))));

    logger.alert(backgroundDefault.wrap(
        styleBold.wrap(red.wrap('Could not find lib folder in $directory'))));

    logger.alert(backgroundDefault.wrap(
        styleBold.wrap(red.wrap('Re-run this brick inside your lib folder'))));

    logger.alert(backgroundDefault.wrap(styleBold.wrap(red.wrap(
        '---------------------------------------------------------------------'))));
    throw Exception();
  } on FileSystemException catch (_) {
    logger.alert(backgroundDefault.wrap(styleBold.wrap(red.wrap(
        '---------------------------------------------------------------------'))));

    logger.alert(backgroundDefault.wrap(styleBold.wrap(red.wrap(
        'Could not find pubspec.yaml folder in ${directory.replaceAll('\\lib', '')}'))));

    logger.alert(backgroundDefault.wrap(styleBold.wrap(red.wrap(
        '---------------------------------------------------------------------'))));
    throw Exception();
  } on PubspecNameException catch (_) {
    logger.alert(backgroundDefault.wrap(styleBold.wrap(red.wrap(
        '---------------------------------------------------------------------'))));

    logger.alert(backgroundDefault.wrap(styleBold
        .wrap(red.wrap('Could not read package name in pubspec.yaml'))));

    logger.alert(backgroundDefault
        .wrap(styleBold.wrap(red.wrap('Does your pubspec have a name?'))));

    logger.alert(backgroundDefault.wrap(styleBold.wrap(red.wrap(
        '---------------------------------------------------------------------'))));

    throw Exception();
  } catch (e) {
    throw Exception("The output directory should be inside the lib folder.");
  }
}

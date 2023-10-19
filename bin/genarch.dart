import 'dart:io';

void main(List<String> arguments) {
  final currentDir = Directory.current;
  final pubspecFile = File('${currentDir.path}/pubspec.yaml');

  if (!pubspecFile.existsSync()) {
    print(
        "Couldn't find 'pubspec.yaml'. Make sure you're in a Flutter project directory.");
    exit(1);
  }

  final pubspecContent = pubspecFile.readAsStringSync();

  if (!isFlutterProject(pubspecContent)) {
    print(
        "This doesn't seem to be a Flutter project. Please ensure you're in the root directory of a Flutter project.");
    exit(1);
  }

  if (arguments.isEmpty) {
    print('Usage: flutter_genarch <feature_name>');
    exit(1);
  }

  final featureName = arguments[0];
  final featuresDir = Directory('${currentDir.path}/lib/features');

  if (!featuresDir.existsSync()) {
    featuresDir.createSync();
  }

  final featureDirs = [
    'data/data_sources',
    'data/models',
    'data/repositories',
    'domain/entities',
    'domain/repositories',
    'domain/use_cases',
    'presentation/bloc',
    'presentation/pages',
    'presentation/widgets',
  ];

  for (final dir in featureDirs) {
    Directory('${featuresDir.path}/$featureName/$dir')
        .createSync(recursive: true);
  }

  print("Directory structure for '$featureName' created successfully!");
}

bool isFlutterProject(String content) {
  var lines = content.split('\n');
  for (var i = 0; i < lines.length; i++) {
    if (lines[i].trim() == 'flutter:') {
      for (var j = i + 1; j < lines.length && j < i + 5; j++) {
        if (lines[j].trim().startsWith('sdk: flutter')) {
          return true;
        }
      }
    }
  }
  return false;
}

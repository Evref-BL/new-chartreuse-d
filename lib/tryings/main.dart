import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/session.dart';
import 'package:chartreuse_d/tryings/dart-visitors/myASTVisitor.dart';
import 'package:chartreuse_d/tryings/singletons/NodesChain.dart';
import 'package:chartreuse_d/tryings/singletons/nodeOccurences.dart';

import 'dart:io';

Future<void> main() async {
  var s = SingletonOccurrences();
  print(s.toString());

  var t = SingletonNodesChain();
  print(t.toString());

  List<String> includedPaths = <String>[
    '/Users/nicolashlad/Development/Projects/pokecard-tcg/lib',
    '/Users/nicolashlad/Development/Projects/anim-search-vanilla/lib',
    '/Users/nicolashlad/Development/Projects/tv-randshow/lib'
  ];
  AnalysisContextCollection collection =
      AnalysisContextCollection(includedPaths: includedPaths);

  await analyzeAllFiles(collection);

  writeStringToFile(SingletonOccurrences.toCsv(),
      '/Users/nicolashlad/Development/parsingoccurrence.csv');

  writeStringToFile(SingletonNodesChain.toMermaid(),
      '/Users/nicolashlad/Development/markov.txt');
}

Future<void> writeStringToFile(String content, String filePath) async {
  try {
    final file = File(filePath);

    // Open the file in write mode and write the content
    await file.writeAsString(content);

    print('String written to $filePath');
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> analyzeAllFiles(AnalysisContextCollection collection) async {
  for (AnalysisContext context in collection.contexts) {
    for (String path in context.contextRoot.analyzedFiles()) {
      await analyzeSingleFile(context, path);
    }
  }
}

analyzeSingleFile(AnalysisContext context, String path) async {
  AnalysisSession session = context.currentSession;
  var ast = await session.getResolvedUnit(path);
  final visitor = ASTVisitor();
  //print((ast as ResolvedUnitResult).content);
  (ast as ResolvedUnitResult).unit.accept(visitor);
}

abstract class FamixEntity {
  String mooseName = '';
  String mooseID = '';
  Map<String, dynamic> entityAttributes = <String, dynamic>{};
}

class DartCompilationUnit extends FamixEntity {}

class DartImportDirective extends FamixEntity {}

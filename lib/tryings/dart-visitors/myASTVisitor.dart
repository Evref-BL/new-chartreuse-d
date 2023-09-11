import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:chartreuse_d/tryings/singletons/nodeOccurences.dart';
import 'package:chartreuse_d/tryings/singletons/nodesChain.dart';

String removeSuffix(String input, String suffixToRemove) {
  if (input.endsWith(suffixToRemove)) {
    return input.substring(0, input.length - suffixToRemove.length);
  }
  return input; // No suffix found, return the original string
}

String resolveName(dynamic node) {
  return removeSuffix(node.runtimeType.toString(), 'Impl');
}

class ASTVisitor extends GeneralizingAstVisitor<void> {
  Map<String, dynamic> _occ = {};
  Map<String, dynamic> _markov = {};
  String last = '';

  ASTVisitor() {
    _occ = SingletonOccurrences.instance;
    _markov = SingletonNodesChain.instance;
    last = '';
  }

  void _fillOccurrences(dynamic node) {
    var name = resolveName(node);
    if (_occ.containsKey(name)) {
      _occ[name] = _occ[name]! + 1;
    } else {
      _occ[name] = 1;
    }
  }

  void _fillChain(dynamic node) {
    var name = resolveName(node);
    String link = '$last --> $name';
    if (_markov.containsKey(link)) {
      _markov[link] = _markov[link]! + 1;
    } else {
      _markov[link] = 1;
    }
  }

  void _computeInfos(dynamic node) {
    _fillOccurrences(node);

    if (last.isNotEmpty) {
      _fillChain(node);
    }

    last = resolveName(node);
  }

  @override
  void visitAdjacentStrings(AdjacentStrings node) {
    _computeInfos(node);
    super.visitAdjacentStrings(node);
  }

  @override
  void visitAnnotatedNode(AnnotatedNode node) {
    _computeInfos(node);
    super.visitAnnotatedNode(node);
  }

  @override
  void visitAnnotation(Annotation node) {
    _computeInfos(node);
    super.visitAnnotation(node);
  }

  @override
  void visitArgumentList(ArgumentList node) {
    _computeInfos(node);
    super.visitArgumentList(node);
  }

  @override
  void visitAsExpression(AsExpression node) {
    _computeInfos(node);
    super.visitAsExpression(node);
  }

  @override
  void visitAssertInitializer(AssertInitializer node) {
    _computeInfos(node);
    super.visitAssertInitializer(node);
  }

  @override
  void visitAssertStatement(AssertStatement node) {
    _computeInfos(node);
    super.visitAssertStatement(node);
  }

  @override
  void visitAssignmentExpression(AssignmentExpression node) {
    _computeInfos(node);
    super.visitAssignmentExpression(node);
  }

  @override
  void visitAwaitExpression(AwaitExpression node) {
    _computeInfos(node);
    super.visitAwaitExpression(node);
  }

  @override
  void visitBinaryExpression(BinaryExpression node) {
    _computeInfos(node);
    super.visitBinaryExpression(node);
  }

  @override
  void visitBlock(Block node) {
    _computeInfos(node);
    super.visitBlock(node);
  }

  @override
  void visitBlockFunctionBody(BlockFunctionBody node) {
    _computeInfos(node);
    super.visitBlockFunctionBody(node);
  }

  @override
  void visitBooleanLiteral(BooleanLiteral node) {
    _computeInfos(node);
    super.visitBooleanLiteral(node);
  }

  @override
  void visitBreakStatement(BreakStatement node) {
    _computeInfos(node);
    super.visitBreakStatement(node);
  }

  @override
  void visitCascadeExpression(CascadeExpression node) {
    _computeInfos(node);
    super.visitCascadeExpression(node);
  }

  @override
  void visitCatchClause(CatchClause node) {
    _computeInfos(node);
    super.visitCatchClause(node);
  }

  @override
  void visitClassDeclaration(ClassDeclaration node) {
    _computeInfos(node);
    super.visitClassDeclaration(node);
  }

  @override
  void visitClassMember(ClassMember node) {
    _computeInfos(node);
    super.visitClassMember(node);
  }

  @override
  void visitClassTypeAlias(ClassTypeAlias node) {
    _computeInfos(node);
    super.visitClassTypeAlias(node);
  }

  @override
  void visitCollectionElement(CollectionElement node) {
    _computeInfos(node);
    super.visitCollectionElement(node);
  }

  @override
  void visitCombinator(Combinator node) {
    _computeInfos(node);
    super.visitCombinator(node);
  }

  @override
  void visitComment(Comment node) {
    _computeInfos(node);
    super.visitComment(node);
  }

  @override
  void visitCommentReference(CommentReference node) {
    _computeInfos(node);
    super.visitCommentReference(node);
  }

  @override
  void visitCompilationUnit(CompilationUnit node) {
    _computeInfos(node);
    super.visitCompilationUnit(node);
  }

  @override
  void visitCompilationUnitMember(CompilationUnitMember node) {
    _computeInfos(node);
    super.visitCompilationUnitMember(node);
  }

  @override
  void visitConditionalExpression(ConditionalExpression node) {
    _computeInfos(node);
    super.visitConditionalExpression(node);
  }

  @override
  void visitConfiguration(Configuration node) {
    _computeInfos(node);
    super.visitConfiguration(node);
  }

  @override
  void visitConstructorDeclaration(ConstructorDeclaration node) {
    _computeInfos(node);
    super.visitConstructorDeclaration(node);
  }

  @override
  void visitConstructorFieldInitializer(ConstructorFieldInitializer node) {
    _computeInfos(node);
    super.visitConstructorFieldInitializer(node);
  }

  @override
  void visitConstructorInitializer(ConstructorInitializer node) {
    _computeInfos(node);
    super.visitConstructorInitializer(node);
  }

  @override
  void visitConstructorName(ConstructorName node) {
    _computeInfos(node);
    super.visitConstructorName(node);
  }

  @override
  void visitConstructorReference(ConstructorReference node) {
    _computeInfos(node);
    super.visitConstructorReference(node);
  }

  @override
  void visitConstructorSelector(ConstructorSelector node) {
    _computeInfos(node);
    super.visitConstructorSelector(node);
  }

  @override
  void visitContinueStatement(ContinueStatement node) {
    _computeInfos(node);
    super.visitContinueStatement(node);
  }

  @override
  void visitDeclaration(Declaration node) {
    _computeInfos(node);
    super.visitDeclaration(node);
  }

  @override
  void visitDeclaredIdentifier(DeclaredIdentifier node) {
    _computeInfos(node);
    super.visitDeclaredIdentifier(node);
  }

  @override
  void visitDefaultFormalParameter(DefaultFormalParameter node) {
    _computeInfos(node);
    super.visitDefaultFormalParameter(node);
  }

  @override
  void visitDirective(Directive node) {
    _computeInfos(node);
    super.visitDirective(node);
  }

  @override
  void visitDoStatement(DoStatement node) {
    _computeInfos(node);
    super.visitDoStatement(node);
  }

  @override
  void visitDottedName(DottedName node) {
    _computeInfos(node);
    super.visitDottedName(node);
  }

  @override
  void visitDoubleLiteral(DoubleLiteral node) {
    _computeInfos(node);
    super.visitDoubleLiteral(node);
  }

  @override
  void visitEmptyFunctionBody(EmptyFunctionBody node) {
    _computeInfos(node);
    super.visitEmptyFunctionBody(node);
  }

  @override
  void visitEmptyStatement(EmptyStatement node) {
    _computeInfos(node);
    super.visitEmptyStatement(node);
  }

  @override
  void visitEnumConstantArguments(EnumConstantArguments node) {
    _computeInfos(node);
    super.visitEnumConstantArguments(node);
  }

  @override
  void visitEnumConstantDeclaration(EnumConstantDeclaration node) {
    _computeInfos(node);
    super.visitEnumConstantDeclaration(node);
  }

  @override
  void visitEnumDeclaration(EnumDeclaration node) {
    _computeInfos(node);
    super.visitEnumDeclaration(node);
  }

  @override
  void visitExportDirective(ExportDirective node) {
    _computeInfos(node);
    super.visitExportDirective(node);
  }

  @override
  void visitExpression(Expression node) {
    _computeInfos(node);
    super.visitExpression(node);
  }

  @override
  void visitExpressionFunctionBody(ExpressionFunctionBody node) {
    _computeInfos(node);
    super.visitExpressionFunctionBody(node);
  }

  @override
  void visitExpressionStatement(ExpressionStatement node) {
    _computeInfos(node);
    super.visitExpressionStatement(node);
  }

  @override
  void visitExtendsClause(ExtendsClause node) {
    _computeInfos(node);
    super.visitExtendsClause(node);
  }

  @override
  void visitExtensionDeclaration(ExtensionDeclaration node) {
    _computeInfos(node);
    super.visitExtensionDeclaration(node);
  }

  @override
  void visitExtensionOverride(ExtensionOverride node) {
    _computeInfos(node);
    super.visitExtensionOverride(node);
  }

  @override
  void visitFieldDeclaration(FieldDeclaration node) {
    _computeInfos(node);
    super.visitFieldDeclaration(node);
  }

  @override
  void visitFieldFormalParameter(FieldFormalParameter node) {
    _computeInfos(node);
    super.visitFieldFormalParameter(node);
  }

  @override
  void visitForEachParts(ForEachParts node) {
    _computeInfos(node);
    super.visitForEachParts(node);
  }

  @override
  void visitForEachPartsWithDeclaration(ForEachPartsWithDeclaration node) {
    _computeInfos(node);
    super.visitForEachPartsWithDeclaration(node);
  }

  @override
  void visitForEachPartsWithIdentifier(ForEachPartsWithIdentifier node) {
    _computeInfos(node);
    super.visitForEachPartsWithIdentifier(node);
  }

  @override
  void visitForElement(ForElement node) {
    _computeInfos(node);
    super.visitForElement(node);
  }

  @override
  void visitFormalParameter(FormalParameter node) {
    _computeInfos(node);
    super.visitFormalParameter(node);
  }

  @override
  void visitFormalParameterList(FormalParameterList node) {
    _computeInfos(node);
    super.visitFormalParameterList(node);
  }

  @override
  void visitForParts(ForParts node) {
    _computeInfos(node);
    super.visitForParts(node);
  }

  @override
  void visitForPartsWithDeclarations(ForPartsWithDeclarations node) {
    _computeInfos(node);
    super.visitForPartsWithDeclarations(node);
  }

  @override
  void visitForPartsWithExpression(ForPartsWithExpression node) {
    _computeInfos(node);
    super.visitForPartsWithExpression(node);
  }

  @override
  void visitForStatement(ForStatement node) {
    _computeInfos(node);
    super.visitForStatement(node);
  }

  @override
  void visitFunctionBody(FunctionBody node) {
    _computeInfos(node);
    super.visitFunctionBody(node);
  }

  @override
  void visitFunctionDeclaration(FunctionDeclaration node) {
    _computeInfos(node);
    super.visitFunctionDeclaration(node);
  }

  @override
  void visitFunctionDeclarationStatement(FunctionDeclarationStatement node) {
    _computeInfos(node);
    super.visitFunctionDeclarationStatement(node);
  }

  @override
  void visitFunctionExpression(FunctionExpression node) {
    _computeInfos(node);
    super.visitFunctionExpression(node);
  }

  @override
  void visitFunctionExpressionInvocation(FunctionExpressionInvocation node) {
    _computeInfos(node);
    super.visitFunctionExpressionInvocation(node);
  }

  @override
  void visitFunctionReference(FunctionReference node) {
    _computeInfos(node);
    super.visitFunctionReference(node);
  }

  @override
  void visitFunctionTypeAlias(FunctionTypeAlias node) {
    _computeInfos(node);
    super.visitFunctionTypeAlias(node);
  }

  @override
  void visitFunctionTypedFormalParameter(FunctionTypedFormalParameter node) {
    _computeInfos(node);
    super.visitFunctionTypedFormalParameter(node);
  }

  @override
  void visitGenericFunctionType(GenericFunctionType node) {
    _computeInfos(node);
    super.visitGenericFunctionType(node);
  }

  @override
  void visitGenericTypeAlias(GenericTypeAlias node) {
    _computeInfos(node);
    super.visitGenericTypeAlias(node);
  }

  @override
  void visitHideClause(HideClause node) {
    _computeInfos(node);
    super.visitHideClause(node);
  }

  @override
  void visitHideCombinator(HideCombinator node) {
    _computeInfos(node);
    super.visitHideCombinator(node);
  }

  @override
  void visitIdentifier(Identifier node) {
    _computeInfos(node);
    super.visitIdentifier(node);
  }

  @override
  void visitIfElement(IfElement node) {
    _computeInfos(node);
    super.visitIfElement(node);
  }

  @override
  void visitIfStatement(IfStatement node) {
    _computeInfos(node);
    super.visitIfStatement(node);
  }

  @override
  void visitImplementsClause(ImplementsClause node) {
    _computeInfos(node);
    super.visitImplementsClause(node);
  }

  @override
  void visitImplicitCallReference(ImplicitCallReference node) {
    _computeInfos(node);
    super.visitImplicitCallReference(node);
  }

  @override
  void visitImportDirective(ImportDirective node) {
    _computeInfos(node);
    super.visitImportDirective(node);
  }

  @override
  void visitIndexExpression(IndexExpression node) {
    _computeInfos(node);
    super.visitIndexExpression(node);
  }

  @override
  void visitInstanceCreationExpression(InstanceCreationExpression node) {
    _computeInfos(node);
    super.visitInstanceCreationExpression(node);
  }

  @override
  void visitIntegerLiteral(IntegerLiteral node) {
    _computeInfos(node);
    super.visitIntegerLiteral(node);
  }

  @override
  void visitInterpolationElement(InterpolationElement node) {
    _computeInfos(node);
    super.visitInterpolationElement(node);
  }

  @override
  void visitInterpolationExpression(InterpolationExpression node) {
    _computeInfos(node);
    super.visitInterpolationExpression(node);
  }

  @override
  void visitInterpolationString(InterpolationString node) {
    _computeInfos(node);
    super.visitInterpolationString(node);
  }

  @override
  void visitInvocationExpression(InvocationExpression node) {
    _computeInfos(node);
    super.visitInvocationExpression(node);
  }

  @override
  void visitIsExpression(IsExpression node) {
    _computeInfos(node);
    super.visitIsExpression(node);
  }

  @override
  void visitLabel(Label node) {
    _computeInfos(node);
    super.visitLabel(node);
  }

  @override
  void visitLabeledStatement(LabeledStatement node) {
    _computeInfos(node);
    super.visitLabeledStatement(node);
  }

  @override
  void visitLibraryAugmentationDirective(LibraryAugmentationDirective node) {
    _computeInfos(node);
    super.visitLibraryAugmentationDirective(node);
  }

  @override
  void visitLibraryDirective(LibraryDirective node) {
    _computeInfos(node);
    super.visitLibraryDirective(node);
  }

  @override
  void visitLibraryIdentifier(LibraryIdentifier node) {
    _computeInfos(node);
    super.visitLibraryIdentifier(node);
  }

  @override
  void visitListLiteral(ListLiteral node) {
    _computeInfos(node);
    super.visitListLiteral(node);
  }

  @override
  void visitLiteral(Literal node) {
    _computeInfos(node);
    super.visitLiteral(node);
  }

  @override
  void visitMapLiteralEntry(MapLiteralEntry node) {
    _computeInfos(node);
    super.visitMapLiteralEntry(node);
  }

  @override
  void visitMethodDeclaration(MethodDeclaration node) {
    _computeInfos(node);
    super.visitMethodDeclaration(node);
  }

  @override
  void visitMethodInvocation(MethodInvocation node) {
    _computeInfos(node);
    super.visitMethodInvocation(node);
  }

  @override
  void visitMixinDeclaration(MixinDeclaration node) {
    _computeInfos(node);
    super.visitMixinDeclaration(node);
  }

  @override
  void visitNamedCompilationUnitMember(NamedCompilationUnitMember node) {
    _computeInfos(node);
    super.visitNamedCompilationUnitMember(node);
  }

  @override
  void visitNamedExpression(NamedExpression node) {
    _computeInfos(node);
    super.visitNamedExpression(node);
  }

  @override
  void visitNamedType(NamedType node) {
    _computeInfos(node);
    super.visitNamedType(node);
  }

  @override
  void visitNamespaceDirective(NamespaceDirective node) {
    _computeInfos(node);
    super.visitNamespaceDirective(node);
  }

  @override
  void visitNativeClause(NativeClause node) {
    _computeInfos(node);
    super.visitNativeClause(node);
  }

  @override
  void visitNativeFunctionBody(NativeFunctionBody node) {
    _computeInfos(node);
    super.visitNativeFunctionBody(node);
  }

  @override
  void visitNormalFormalParameter(NormalFormalParameter node) {
    _computeInfos(node);
    super.visitNormalFormalParameter(node);
  }

  @override
  void visitNullLiteral(NullLiteral node) {
    _computeInfos(node);
    super.visitNullLiteral(node);
  }

  @override
  void visitOnClause(OnClause node) {
    _computeInfos(node);
    super.visitOnClause(node);
  }

  @override
  void visitParenthesizedExpression(ParenthesizedExpression node) {
    _computeInfos(node);
    super.visitParenthesizedExpression(node);
  }

  @override
  void visitPartDirective(PartDirective node) {
    _computeInfos(node);
    super.visitPartDirective(node);
  }

  @override
  void visitPartOfDirective(PartOfDirective node) {
    _computeInfos(node);
    super.visitPartOfDirective(node);
  }

  @override
  void visitPostfixExpression(PostfixExpression node) {
    _computeInfos(node);
    super.visitPostfixExpression(node);
  }

  @override
  void visitPrefixedIdentifier(PrefixedIdentifier node) {
    _computeInfos(node);
    super.visitPrefixedIdentifier(node);
  }

  @override
  void visitPrefixExpression(PrefixExpression node) {
    _computeInfos(node);
    super.visitPrefixExpression(node);
  }

  @override
  void visitPropertyAccess(PropertyAccess node) {
    _computeInfos(node);
    super.visitPropertyAccess(node);
  }

  @override
  void visitRedirectingConstructorInvocation(
      RedirectingConstructorInvocation node) {
    _computeInfos(node);
    super.visitRedirectingConstructorInvocation(node);
  }

  @override
  void visitRethrowExpression(RethrowExpression node) {
    _computeInfos(node);
    super.visitRethrowExpression(node);
  }

  @override
  void visitReturnStatement(ReturnStatement node) {
    _computeInfos(node);
    super.visitReturnStatement(node);
  }

  @override
  void visitScriptTag(ScriptTag scriptTag) {
    _computeInfos(scriptTag);
    super.visitScriptTag(scriptTag);
  }

  @override
  void visitSetOrMapLiteral(SetOrMapLiteral node) {
    _computeInfos(node);
    super.visitSetOrMapLiteral(node);
  }

  @override
  void visitShowClause(ShowClause node) {
    _computeInfos(node);
    super.visitShowClause(node);
  }

  @override
  void visitShowCombinator(ShowCombinator node) {
    _computeInfos(node);
    super.visitShowCombinator(node);
  }

  @override
  void visitShowHideElement(ShowHideElement node) {
    _computeInfos(node);
    super.visitShowHideElement(node);
  }

  @override
  void visitSimpleFormalParameter(SimpleFormalParameter node) {
    _computeInfos(node);
    super.visitSimpleFormalParameter(node);
  }

  @override
  void visitSimpleIdentifier(SimpleIdentifier node) {
    _computeInfos(node);
    super.visitSimpleIdentifier(node);
  }

  @override
  void visitSimpleStringLiteral(SimpleStringLiteral node) {
    _computeInfos(node);
    super.visitSimpleStringLiteral(node);
  }

  @override
  void visitSingleStringLiteral(SingleStringLiteral node) {
    _computeInfos(node);
    super.visitSingleStringLiteral(node);
  }

  @override
  void visitSpreadElement(SpreadElement node) {
    _computeInfos(node);
    super.visitSpreadElement(node);
  }

  @override
  void visitStatement(Statement node) {
    _computeInfos(node);
    super.visitStatement(node);
  }

  @override
  void visitStringInterpolation(StringInterpolation node) {
    _computeInfos(node);
    super.visitStringInterpolation(node);
  }

  @override
  void visitStringLiteral(StringLiteral node) {
    _computeInfos(node);
    super.visitStringLiteral(node);
  }

  @override
  void visitSuperConstructorInvocation(SuperConstructorInvocation node) {
    _computeInfos(node);
    super.visitSuperConstructorInvocation(node);
  }

  @override
  void visitSuperExpression(SuperExpression node) {
    _computeInfos(node);
    super.visitSuperExpression(node);
  }

  @override
  void visitSuperFormalParameter(SuperFormalParameter node) {
    _computeInfos(node);
    super.visitSuperFormalParameter(node);
  }

  @override
  void visitSwitchCase(SwitchCase node) {
    _computeInfos(node);
    super.visitSwitchCase(node);
  }

  @override
  void visitSwitchDefault(SwitchDefault node) {
    _computeInfos(node);
    super.visitSwitchDefault(node);
  }

  @override
  void visitSwitchMember(SwitchMember node) {
    _computeInfos(node);
    super.visitSwitchMember(node);
  }

  @override
  void visitSwitchStatement(SwitchStatement node) {
    _computeInfos(node);
    super.visitSwitchStatement(node);
  }

  @override
  void visitSymbolLiteral(SymbolLiteral node) {
    _computeInfos(node);
    super.visitSymbolLiteral(node);
  }

  @override
  void visitThisExpression(ThisExpression node) {
    _computeInfos(node);
    super.visitThisExpression(node);
  }

  @override
  void visitThrowExpression(ThrowExpression node) {
    _computeInfos(node);
    super.visitThrowExpression(node);
  }

  @override
  void visitTopLevelVariableDeclaration(TopLevelVariableDeclaration node) {
    _computeInfos(node);
    super.visitTopLevelVariableDeclaration(node);
  }

  @override
  void visitTryStatement(TryStatement node) {
    _computeInfos(node);
    super.visitTryStatement(node);
  }

  @override
  void visitTypeAlias(TypeAlias node) {
    _computeInfos(node);
    super.visitTypeAlias(node);
  }

  @override
  void visitTypeAnnotation(TypeAnnotation node) {
    _computeInfos(node);
    super.visitTypeAnnotation(node);
  }

  @override
  void visitTypeArgumentList(TypeArgumentList node) {
    _computeInfos(node);
    super.visitTypeArgumentList(node);
  }

  @override
  void visitTypedLiteral(TypedLiteral node) {
    _computeInfos(node);
    super.visitTypedLiteral(node);
  }

  @override
  void visitTypeLiteral(TypeLiteral node) {
    _computeInfos(node);
    super.visitTypeLiteral(node);
  }

  @override
  void visitTypeParameter(TypeParameter node) {
    _computeInfos(node);
    super.visitTypeParameter(node);
  }

  @override
  void visitTypeParameterList(TypeParameterList node) {
    _computeInfos(node);
    super.visitTypeParameterList(node);
  }

  @override
  void visitUriBasedDirective(UriBasedDirective node) {
    _computeInfos(node);
    super.visitUriBasedDirective(node);
  }

  @override
  void visitVariableDeclaration(VariableDeclaration node) {
    _computeInfos(node);
    super.visitVariableDeclaration(node);
  }

  @override
  void visitVariableDeclarationList(VariableDeclarationList node) {
    _computeInfos(node);
    super.visitVariableDeclarationList(node);
  }

  @override
  void visitVariableDeclarationStatement(VariableDeclarationStatement node) {
    _computeInfos(node);
    super.visitVariableDeclarationStatement(node);
  }

  @override
  void visitWhileStatement(WhileStatement node) {
    _computeInfos(node);
    super.visitWhileStatement(node);
  }

  @override
  void visitWithClause(WithClause node) {
    _computeInfos(node);
    super.visitWithClause(node);
  }

  @override
  void visitYieldStatement(YieldStatement node) {
    _computeInfos(node);
    super.visitYieldStatement(node);
  }
}

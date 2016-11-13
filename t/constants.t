use Binaryen;

my $module = Binaryen::ModuleCreate();
Binaryen::ExpressionPrint Binaryen::Const::FromInt32($module, 7);
Binaryen::ModuleDispose($module);

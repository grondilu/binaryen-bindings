use Binaryen;
use NativeCall;

my $module = Binaryen::ModuleCreate();
my @params := CArray[Binaryen::Type].new;
@params[0] = Binaryen::Int32();
@params[1] = Binaryen::Int32();
my $iii = Binaryen::AddFunctionType $module, "iii", Binaryen::Int32(), @params, 2;

my ($x, $y) = map { Binaryen::GetLocal $module, $_, Binaryen::Int32() }, ^2;
my $add = Binaryen::Binary $module, Binaryen::AddInt32(), $x, $y;

Binaryen::AddFunction $module, "adder", $iii, CArray[Binaryen::Type], 0, $add;

Binaryen::ModulePrint $module;
Binaryen::ModuleDispose $module;

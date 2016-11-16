use Binaryen;

given Binaryen::ModuleCreate() {
    Binaryen::ModulePrint($_);
    Binaryen::ModuleWriteHex($_, 1000);
    Binaryen::ModuleDispose($_);
}

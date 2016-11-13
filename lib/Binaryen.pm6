unit module Binaryen;
use NativeCall;
my sub binaryen { "/usr/local/src/binaryen/lib/libbinaryen.so" }

our constant Index := uint32;
our constant Type  := uint32;

our sub None    returns Type is symbol<BinaryenNone> is native(&binaryen) {*}
our sub Int32   returns Type is symbol<BinaryenInt32> is native(&binaryen) {*}
our sub Int64   returns Type is symbol<BinaryenInt64> is native(&binaryen) {*}
our sub Float32 returns Type is symbol<BinaryenFloat32> is native(&binaryen) {*}
our sub Float64 returns Type is symbol<BinaryenFloat64> is native(&binaryen) {*}

our constant ModuleRef := Pointer;

our sub ModuleCreate returns ModuleRef is symbol<BinaryenModuleCreate> is native(&binaryen) {*}
our sub ModuleDispose(ModuleRef $) is symbol<BinaryenModuleDispose> is native(&binaryen) {*}

our constant FunctionTypeRef := Pointer;

our sub AddFunctionType(
    ModuleRef $module,
    Str $name,
    Type $result,
    CArray[Type],
    Index $numParams
) returns FunctionTypeRef is symbol<BinaryenAddFunctionType> is native(&binaryen) {*}

class Literal is repr('CStruct') {
    class Value is repr('CUnion') {
        has int32 $.i32;
        has int64 $.i64;
        has num32 $.f32;
        has num64 $.f64;
    }
    has int32 $.type;
    has Value $.value;

    our Literal sub Int32(int32) is symbol<LiteralInt32> is native(&binaryen) {*}
    our Literal sub Int64(int64) is symbol<LiteralInt64> is native(&binaryen) {*}
    our Literal sub Float32(num32) is symbol<LiteralFloat32> is native(&binaryen) {*}
    our Literal sub Float64(num64) is symbol<LiteralFloat64> is native(&binaryen) {*}
    our Literal sub Float32Bits(int32) is symbol<LiteralFloat32Bits> is native(&binaryen) {*}
    our Literal sub Float64Bits(num64) is symbol<LiteralFloat64Bits> is native(&binaryen) {*}
}

our constant Op := int32;

our Op sub ClzInt32 is symbol<BinaryenClzInt32> is native(&binaryen) {*}
our Op sub CtzInt32 is symbol<BinaryenCtzInt32> is native(&binaryen) {*}
our Op sub PopcntInt32 is symbol<BinaryenPopcntInt32> is native(&binaryen) {*}
our Op sub NegFloat32 is symbol<BinaryenNegFloat32> is native(&binaryen) {*}
our Op sub AbsFloat32 is symbol<BinaryenAbsFloat32> is native(&binaryen) {*}
our Op sub CeilFloat32 is symbol<BinaryenCeilFloat32> is native(&binaryen) {*}
our Op sub FloorFloat32 is symbol<BinaryenFloorFloat32> is native(&binaryen) {*}
our Op sub TruncFloat32 is symbol<BinaryenTruncFloat32> is native(&binaryen) {*}
our Op sub NearestFloat32 is symbol<BinaryenNearestFloat32> is native(&binaryen) {*}
our Op sub SqrtFloat32 is symbol<BinaryenSqrtFloat32> is native(&binaryen) {*}
our Op sub EqZInt32 is symbol<BinaryenEqZInt32> is native(&binaryen) {*}
our Op sub ClzInt64 is symbol<BinaryenClzInt64> is native(&binaryen) {*}
our Op sub CtzInt64 is symbol<BinaryenCtzInt64> is native(&binaryen) {*}
our Op sub PopcntInt64 is symbol<BinaryenPopcntInt64> is native(&binaryen) {*}
our Op sub NegFloat64 is symbol<BinaryenNegFloat64> is native(&binaryen) {*}
our Op sub AbsFloat64 is symbol<BinaryenAbsFloat64> is native(&binaryen) {*}
our Op sub CeilFloat64 is symbol<BinaryenCeilFloat64> is native(&binaryen) {*}
our Op sub FloorFloat64 is symbol<BinaryenFloorFloat64> is native(&binaryen) {*}
our Op sub TruncFloat64 is symbol<BinaryenTruncFloat64> is native(&binaryen) {*}
our Op sub NearestFloat64 is symbol<BinaryenNearestFloat64> is native(&binaryen) {*}
our Op sub SqrtFloat64 is symbol<BinaryenSqrtFloat64> is native(&binaryen) {*}
our Op sub EqZInt64 is symbol<BinaryenEqZInt64> is native(&binaryen) {*}
our Op sub ExtendSInt32 is symbol<BinaryenExtendSInt32> is native(&binaryen) {*}
our Op sub ExtentUInt32 is symbol<BinaryenExtentUInt32> is native(&binaryen) {*}
our Op sub WrapInt64 is symbol<BinaryenWrapInt64> is native(&binaryen) {*}
our Op sub TruncSFloat32ToInt32 is symbol<BinaryenTruncSFloat32ToInt32> is native(&binaryen) {*}
our Op sub TruncSFloat32ToInt64 is symbol<BinaryenTruncSFloat32ToInt64> is native(&binaryen) {*}
our Op sub TruncUFloat32ToInt32 is symbol<BinaryenTruncUFloat32ToInt32> is native(&binaryen) {*}
our Op sub TruncUFloat32ToInt64 is symbol<BinaryenTruncUFloat32ToInt64> is native(&binaryen) {*}
our Op sub TruncSFloat64ToInt32 is symbol<BinaryenTruncSFloat64ToInt32> is native(&binaryen) {*}
our Op sub TruncSFloat64ToInt64 is symbol<BinaryenTruncSFloat64ToInt64> is native(&binaryen) {*}
our Op sub TruncUFloat64ToInt32 is symbol<BinaryenTruncUFloat64ToInt32> is native(&binaryen) {*}
our Op sub TruncUFloat64ToInt64 is symbol<BinaryenTruncUFloat64ToInt64> is native(&binaryen) {*}
our Op sub ReinterpretFloat32 is symbol<BinaryenReinterpretFloat32> is native(&binaryen) {*}
our Op sub ReinterpretFloat64 is symbol<BinaryenReinterpretFloat64> is native(&binaryen) {*}
our Op sub ConvertSInt32ToFloat32 is symbol<BinaryenConvertSInt32ToFloat32> is native(&binaryen) {*}
our Op sub ConvertSInt32ToFloat64 is symbol<BinaryenConvertSInt32ToFloat64> is native(&binaryen) {*}
our Op sub ConvertUInt32ToFloat32 is symbol<BinaryenConvertUInt32ToFloat32> is native(&binaryen) {*}
our Op sub ConvertUInt32ToFloat64 is symbol<BinaryenConvertUInt32ToFloat64> is native(&binaryen) {*}
our Op sub ConvertSInt64ToFloat32 is symbol<BinaryenConvertSInt64ToFloat32> is native(&binaryen) {*}
our Op sub ConvertSInt64ToFloat64 is symbol<BinaryenConvertSInt64ToFloat64> is native(&binaryen) {*}
our Op sub ConvertUInt64ToFloat32 is symbol<BinaryenConvertUInt64ToFloat32> is native(&binaryen) {*}
our Op sub ConvertUInt64ToFloat64 is symbol<BinaryenConvertUInt64ToFloat64> is native(&binaryen) {*}
our Op sub PromoteFloat32 is symbol<BinaryenPromoteFloat32> is native(&binaryen) {*}
our Op sub DemoteFloat64 is symbol<BinaryenDemoteFloat64> is native(&binaryen) {*}
our Op sub ReinterpretInt32 is symbol<BinaryenReinterpretInt32> is native(&binaryen) {*}
our Op sub ReinterpretInt64 is symbol<BinaryenReinterpretInt64> is native(&binaryen) {*}
our Op sub AddInt32 is symbol<BinaryenAddInt32> is native(&binaryen) {*}
our Op sub SubInt32 is symbol<BinaryenSubInt32> is native(&binaryen) {*}
our Op sub MulInt32 is symbol<BinaryenMulInt32> is native(&binaryen) {*}
our Op sub DivSInt32 is symbol<BinaryenDivSInt32> is native(&binaryen) {*}
our Op sub DivUInt32 is symbol<BinaryenDivUInt32> is native(&binaryen) {*}
our Op sub RemSInt32 is symbol<BinaryenRemSInt32> is native(&binaryen) {*}
our Op sub RemUInt32 is symbol<BinaryenRemUInt32> is native(&binaryen) {*}
our Op sub AndInt32 is symbol<BinaryenAndInt32> is native(&binaryen) {*}
our Op sub OrInt32 is symbol<BinaryenOrInt32> is native(&binaryen) {*}
our Op sub XorInt32 is symbol<BinaryenXorInt32> is native(&binaryen) {*}
our Op sub ShlInt32 is symbol<BinaryenShlInt32> is native(&binaryen) {*}
our Op sub ShrUInt32 is symbol<BinaryenShrUInt32> is native(&binaryen) {*}
our Op sub ShrSInt32 is symbol<BinaryenShrSInt32> is native(&binaryen) {*}
our Op sub RotLInt32 is symbol<BinaryenRotLInt32> is native(&binaryen) {*}
our Op sub RotRInt32 is symbol<BinaryenRotRInt32> is native(&binaryen) {*}
our Op sub EqInt32 is symbol<BinaryenEqInt32> is native(&binaryen) {*}
our Op sub NeInt32 is symbol<BinaryenNeInt32> is native(&binaryen) {*}
our Op sub LtSInt32 is symbol<BinaryenLtSInt32> is native(&binaryen) {*}
our Op sub LtUInt32 is symbol<BinaryenLtUInt32> is native(&binaryen) {*}
our Op sub LeSInt32 is symbol<BinaryenLeSInt32> is native(&binaryen) {*}
our Op sub LeUInt32 is symbol<BinaryenLeUInt32> is native(&binaryen) {*}
our Op sub GtSInt32 is symbol<BinaryenGtSInt32> is native(&binaryen) {*}
our Op sub GtUInt32 is symbol<BinaryenGtUInt32> is native(&binaryen) {*}
our Op sub GeSInt32 is symbol<BinaryenGeSInt32> is native(&binaryen) {*}
our Op sub GeUInt32 is symbol<BinaryenGeUInt32> is native(&binaryen) {*}
our Op sub AddInt64 is symbol<BinaryenAddInt64> is native(&binaryen) {*}
our Op sub SubInt64 is symbol<BinaryenSubInt64> is native(&binaryen) {*}
our Op sub MulInt64 is symbol<BinaryenMulInt64> is native(&binaryen) {*}
our Op sub DivSInt64 is symbol<BinaryenDivSInt64> is native(&binaryen) {*}
our Op sub DivUInt64 is symbol<BinaryenDivUInt64> is native(&binaryen) {*}
our Op sub RemSInt64 is symbol<BinaryenRemSInt64> is native(&binaryen) {*}
our Op sub RemUInt64 is symbol<BinaryenRemUInt64> is native(&binaryen) {*}
our Op sub AndInt64 is symbol<BinaryenAndInt64> is native(&binaryen) {*}
our Op sub OrInt64 is symbol<BinaryenOrInt64> is native(&binaryen) {*}
our Op sub XorInt64 is symbol<BinaryenXorInt64> is native(&binaryen) {*}
our Op sub ShlInt64 is symbol<BinaryenShlInt64> is native(&binaryen) {*}
our Op sub ShrUInt64 is symbol<BinaryenShrUInt64> is native(&binaryen) {*}
our Op sub ShrSInt64 is symbol<BinaryenShrSInt64> is native(&binaryen) {*}
our Op sub RotLInt64 is symbol<BinaryenRotLInt64> is native(&binaryen) {*}
our Op sub RotRInt64 is symbol<BinaryenRotRInt64> is native(&binaryen) {*}
our Op sub EqInt64 is symbol<BinaryenEqInt64> is native(&binaryen) {*}
our Op sub NeInt64 is symbol<BinaryenNeInt64> is native(&binaryen) {*}
our Op sub LtSInt64 is symbol<BinaryenLtSInt64> is native(&binaryen) {*}
our Op sub LtUInt64 is symbol<BinaryenLtUInt64> is native(&binaryen) {*}
our Op sub LeSInt64 is symbol<BinaryenLeSInt64> is native(&binaryen) {*}
our Op sub LeUInt64 is symbol<BinaryenLeUInt64> is native(&binaryen) {*}
our Op sub GtSInt64 is symbol<BinaryenGtSInt64> is native(&binaryen) {*}
our Op sub GtUInt64 is symbol<BinaryenGtUInt64> is native(&binaryen) {*}
our Op sub GeSInt64 is symbol<BinaryenGeSInt64> is native(&binaryen) {*}
our Op sub GeUInt64 is symbol<BinaryenGeUInt64> is native(&binaryen) {*}
our Op sub AddFloat32 is symbol<BinaryenAddFloat32> is native(&binaryen) {*}
our Op sub SubFloat32 is symbol<BinaryenSubFloat32> is native(&binaryen) {*}
our Op sub MulFloat32 is symbol<BinaryenMulFloat32> is native(&binaryen) {*}
our Op sub DivFloat32 is symbol<BinaryenDivFloat32> is native(&binaryen) {*}
our Op sub CopySignFloat32 is symbol<BinaryenCopySignFloat32> is native(&binaryen) {*}
our Op sub MinFloat32 is symbol<BinaryenMinFloat32> is native(&binaryen) {*}
our Op sub MaxFloat32 is symbol<BinaryenMaxFloat32> is native(&binaryen) {*}
our Op sub EqFloat32 is symbol<BinaryenEqFloat32> is native(&binaryen) {*}
our Op sub NeFloat32 is symbol<BinaryenNeFloat32> is native(&binaryen) {*}
our Op sub LtFloat32 is symbol<BinaryenLtFloat32> is native(&binaryen) {*}
our Op sub LeFloat32 is symbol<BinaryenLeFloat32> is native(&binaryen) {*}
our Op sub GtFloat32 is symbol<BinaryenGtFloat32> is native(&binaryen) {*}
our Op sub GeFloat32 is symbol<BinaryenGeFloat32> is native(&binaryen) {*}
our Op sub AddFloat64 is symbol<BinaryenAddFloat64> is native(&binaryen) {*}
our Op sub SubFloat64 is symbol<BinaryenSubFloat64> is native(&binaryen) {*}
our Op sub MulFloat64 is symbol<BinaryenMulFloat64> is native(&binaryen) {*}
our Op sub DivFloat64 is symbol<BinaryenDivFloat64> is native(&binaryen) {*}
our Op sub CopySignFloat64 is symbol<BinaryenCopySignFloat64> is native(&binaryen) {*}
our Op sub MinFloat64 is symbol<BinaryenMinFloat64> is native(&binaryen) {*}
our Op sub MaxFloat64 is symbol<BinaryenMaxFloat64> is native(&binaryen) {*}
our Op sub EqFloat64 is symbol<BinaryenEqFloat64> is native(&binaryen) {*}
our Op sub NeFloat64 is symbol<BinaryenNeFloat64> is native(&binaryen) {*}
our Op sub LtFloat64 is symbol<BinaryenLtFloat64> is native(&binaryen) {*}
our Op sub LeFloat64 is symbol<BinaryenLeFloat64> is native(&binaryen) {*}
our Op sub GtFloat64 is symbol<BinaryenGtFloat64> is native(&binaryen) {*}
our Op sub GeFloat64 is symbol<BinaryenGeFloat64> is native(&binaryen) {*}
our Op sub PageSize is symbol<BinaryenPageSize> is native(&binaryen) {*}
our Op sub CurrentMemory is symbol<BinaryenCurrentMemory> is native(&binaryen) {*}
our Op sub GrowMemory is symbol<BinaryenGrowMemory> is native(&binaryen) {*}
our Op sub HasFeature is symbol<BinaryenHasFeature> is native(&binaryen) {*}

our constant ExpressionRef := Pointer;

our ExpressionRef sub Block(ModuleRef, Str $name, CArray[Index] $children, Index $numChildren) is symbol<BinaryenBlock> is native(&binaryen) {*}

our ExpressionRef sub If(ModuleRef, ExpressionRef $condition, ExpressionRef $ifTrue, ExpressionRef $ifFalse) is symbol<BinaryenIf> is native(&binaryen) {*}
our ExpressionRef sub Loop(ModuleRef, Str $in, ExpressionRef $body) is symbol<BinaryenLoop> is native(&binaryen) {*}
our ExpressionRef sub Break(ModuleRef, Str $name, ExpressionRef $condition, ExpressionRef $value) is symbol<BinaryenBreak> is native(&binaryen) {*}
our ExpressionRef sub Switch(ModuleRef, CArray[Str] $names, Index $numNames, Str $defaultName, ExpressionRef $condition, ExpressionRef $value) is symbol<BinaryenSwitch> is native(&binaryen) {*}

our ExpressionRef sub Call        (ModuleRef, Str $target, CArray[ExpressionRef] $operands, Index $numOperands, Type $returnType) is symbol<BinaryenCall> is native(&binaryen) {*}
our ExpressionRef sub CallImport  (ModuleRef, Str $target, CArray[ExpressionRef] $operands, Index $numOperands, Type $returnType) is symbol<BinaryenCallImport> is native(&binaryen) {*}
our ExpressionRef sub CallIndirect(ModuleRef, ExpressionRef $target, CArray[ExpressionRef] $operands, Index $numOperands, Str $type) is symbol<BinaryenCallIndirect> is native(&binaryen) {*}

our ExpressionRef sub GetLocal(ModuleRef, Index, Type) is symbol<BinaryenGetLocal> is native(&binaryen) {*}
our ExpressionRef sub SetLocal(ModuleRef, Index, ExpressionRef $value) is symbol<BinaryenSetLocal> is native(&binaryen) {*}
our ExpressionRef sub TeeLocal(ModuleRef, Index, ExpressionRef $value) is symbol<BinaryenTeeLocal> is native(&binaryen) {*}

our ExpressionRef sub Load(ModuleRef, uint32 $bytes, int8 $signed, uint32 $offset, uint32 $align, Type, ExpressionRef $ptr) is symbol<BinaryenLoad> is native(&binaryen) {*}

our ExpressionRef sub Store(ModuleRef, uint32 $bytes, uint32 $offset, uint32 $align, ExpressionRef $ptr, ExpressionRef $value, Type) is symbol<BinaryenStore> is native(&binaryen) {*}
our ExpressionRef sub Const(ModuleRef, Literal $value) is symbol<BinaryenConst> is native(&binaryen) {*}
our ExpressionRef sub Unary(ModuleRef, Op, ExpressionRef $value) is symbol<BinaryenUnary> is native(&binaryen) {*}
our ExpressionRef sub Binary(ModuleRef, Op, ExpressionRef $left, ExpressionRef $right) is symbol<BinaryenBinary> is native(&binaryen) {*}
our ExpressionRef sub Select(ModuleRef, ExpressionRef $condition, ExpressionRef $ifTrue, ExpressionRef $ifFalse) is symbol<BinaryenSelect> is native(&binaryen) {*}
our ExpressionRef sub Drop(ModuleRef, ExpressionRef $value) is symbol<BinaryenDrop> is native(&binaryen) {*}

our ExpressionRef sub Return(ModuleRef, ExpressionRef $value) is symbol<BinaryenReturn> is native(&binaryen) {*}

our ExpressionRef sub Host(ModuleRef, Op, Str $name, CArray[ExpressionRef] $operands, Index $numOperands) is symbol<BinaryenHost> is native(&binaryen) {*}
our ExpressionRef sub Nop(ModuleRef) is symbol<BinaryenNop> is native(&binaryen) {*}
our ExpressionRef sub Unreachable(ModuleRef) is symbol<BinaryenUnreachable> is native(&binaryen) {*}


our sub ExpressionPrint(ExpressionRef) is symbol<BinaryenExpressionPrint> is native(&binaryen) {*}

our constant FunctionRef := Pointer;

our FunctionRef sub AddFunction(
    ModuleRef,
    Str $name,
    FunctionTypeRef,
    CArray[Type] $varTypes,
    Index $numVarTypes,
    ExpressionRef $body
) is symbol<BinaryenAddFunction> is native(&binaryen) {*}

our constant ImportRef := Pointer;

our ImportRef sub AddImport(ModuleRef, Str $internalName, Str $externalModuleName, Str $externalBaseName, FunctionTypeRef) is symbol<BinaryenAddImport> is native(&binaryen) {*}

our constant ExportRef := Pointer;
our ExportRef sub AddExport(ModuleRef, Str $internalName, Str $externalName) is symbol<BinaryenAddExport> is native(&binaryen) {*}

our sub SetFunctionTable(ModuleRef, CArray[FunctionRef] $funcs, Index $numFuncs) is symbol<BinaryenSetFunctionTable> is native(&binaryen) {*}
our sub SetMemory(ModuleRef, Index $initial, Index $maximum, Str $exportName, CArray[Str] $segments, CArray[ExpressionRef] $segmentOffsets, CArray[Index] $segmentSizes, Index $numSegments) is symbol<BinaryenSetMemory> is native(&binaryen) {*}
our sub SetStart(ModuleRef, FunctionRef $start) is symbol<BinaryenSetStart> is native(&binaryen) {*}

our sub ModulePrint(ModuleRef) is symbol<BinaryenModulePrint> is native(&binaryen) {*}

our int32 sub ModuleValidate(ModuleRef) is symbol<BinaryenModuleValidate> is native(&binaryen) {*}
our sub ModuleOptimize(ModuleRef) is symbol<BinaryenModuleOptimize> is native(&binaryen) {*}

our sub ModuleAutoDrop(ModuleRef) is symbol<BinaryenModuleAutoDrop> is native(&binaryen) {*}

# need to redefine size_t here,
# for some reason I can't re-use the exact same identifier
our constant size-t := uint32;

our size-t sub ModuleWrite(ModuleRef, Str $output, size-t $outputSize) is symbol<BinaryenModuleWrite> is native(&binaryen) {*}

our ModuleRef sub ModuleRead(buf8 $input, size-t $inputSize) is symbol<BinaryenModuleRead> is native(&binaryen) {*}

our sub ModuleInterpret(ModuleRef) is symbol<BinaryenModuleInterpret> is native(&binaryen) {*}

our constant RelooperRef      is export := Pointer;
our constant RelooperBlockRef is export := Pointer;

our RelooperRef      sub RelooperCreate is native(&binaryen) is export {*}
our RelooperBlockRef sub RelooperAddBlock(RelooperRef, ExpressionRef $code) is native(&binaryen) is export {*}

our sub RelooperAddBranch(RelooperBlockRef $from, RelooperBlockRef $to, ExpressionRef $condition, ExpressionRef $code) is native(&binaryen) is export {*}
our RelooperBlockRef sub RelooperAddBlockWithSwitch(RelooperRef, ExpressionRef $code, ExpressionRef $condition) is native(&binaryen) is export {*}
our sub RelooperAddBranchForSwitch(RelooperBlockRef $from, RelooperBlockRef $to, CArray[Index] $indexes, Index $numIndexes, ExpressionRef $code) is export is native(&binaryen) {*}

our ExpressionRef sub RelooperRenderAndDispose(RelooperRef $relooper, RelooperBlockRef $entry, Index $labelHelper, ModuleRef) is export is native(&binaryen) {*}

our sub SetAPITracing(int32 $on) is symbol<BinaryenSetAPITracing> is native(&binaryen) {*}


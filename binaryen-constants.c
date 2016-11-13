#include "binaryen-c.h"

BinaryenExpressionRef BinaryenConstFromInt32(BinaryenModuleRef module, int32_t i) { return BinaryenConst(module, BinaryenLiteralInt32(i)); }
BinaryenExpressionRef BinaryenConstFromInt64(BinaryenModuleRef module, int64_t i) { return BinaryenConst(module, BinaryenLiteralInt64(i)); }
BinaryenExpressionRef BinaryenConstFromFloat32(BinaryenModuleRef module, float x) { return BinaryenConst(module, BinaryenLiteralFloat32(x)); }
BinaryenExpressionRef BinaryenConstFromFloat64(BinaryenModuleRef module, double x) { return BinaryenConst(module, BinaryenLiteralFloat64(x)); }
BinaryenExpressionRef BinaryenConstFromFloat32Bits(BinaryenModuleRef module, int32_t x) { return BinaryenConst(module, BinaryenLiteralFloat32Bits(x)); }
BinaryenExpressionRef BinaryenConstFromFloat64Bits(BinaryenModuleRef module, int64_t x) { return BinaryenConst(module, BinaryenLiteralFloat64Bits(x)); }





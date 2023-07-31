#ifndef UTILS_H
#define UTILS_H

#include "llvm/IR/Instructions.h"

using namespace llvm;

std::string toString(Value *I);

bool isAssertFail(CallInst *CI);

bool isAssume(CallInst *CI);

#endif // UTILS_H

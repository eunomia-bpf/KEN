#include "Utils.h"

#include "llvm/IR/CFG.h"

const char *WhiteSpaces = " \t\n\r";

std::string toString(Value *I) {
  std::string Str;
  raw_string_ostream SS(Str);
  I->print(SS);
  Str.erase(0, Str.find_first_not_of(WhiteSpaces));
  return SS.str().substr(0, Str.find(" ="));
}

bool isAssertFail(CallInst *CI) {
  return CI->getCalledFunction()->getName().equals("__assert_fail");
}

bool isAssume(CallInst *CI) {
  return CI->getCalledFunction()->getName().equals("assume");
}

#include "llvm/AsmParser/Parser.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/SourceMgr.h"
#include <fstream>

#include "Extractor.h"

using namespace llvm;

int main(int argc, char **argv) {
  if (argc > 3) {
    errs() << "Expected an argument - IR file name\n";
    exit(1);
  }

  LLVMContext Context;
  SMDiagnostic Err;
  StringRef FileName(argv[1]);

  std::unique_ptr<Module> Mod = parseAssemblyFile(FileName, Err, Context);

  if (!Mod) {
    Err.print(argv[0], errs());
    return 1;
  }

  Extractor Ext;
  z3::fixedpoint *Solver = Ext.getSolver();
  z3::context &C = Ext.getContext();

  for (auto &F : *Mod) {
    if (F.size() == 0)
      continue;
    Ext.initialize(F);
    for (auto &BB : F) {
      Ext.extractConstraints(&BB);
    }
  }

  std::ofstream smt2("formula.smt2");
  smt2 << Solver->to_string() << std::endl;
  smt2 << ";;; query" << std::endl;

  for (int I = 0; I < Ext.getQueries().size(); I++) {
    smt2 << "(query " << Ext.getQueries()[I].name().str() << ")" << std::endl;
  }

  z3::check_result R = Solver->query(Ext.getQueries());
  
  std::cout << R << std::endl;
  return 0;
}

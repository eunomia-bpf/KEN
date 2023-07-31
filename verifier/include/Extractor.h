#ifndef EXTRACTOR_H
#define EXTRACTOR_H

#include "Utils.h"
#include "z3++.h"
#include "llvm/ADT/MapVector.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Type.h"
#include <iostream>
#include <map>
#include <set>

using namespace llvm;

using InstMapTy = std::map<Value *, unsigned int>;
using DefMapTy = std::map<Value *, std::set<Value *>>;

class Extractor {
public:
  Extractor() : AllVariableVector(C), Queries(C) {
    Solver = new z3::fixedpoint(C);
    Params = new z3::params(C);
    Params->set("engine", "spacer");
    Solver->set(*Params);
  }

  ~Extractor() {
    delete Solver;
    delete Params;
  }

  z3::fixedpoint *getSolver() { return Solver; }
  z3::context &getContext() { return C; }
  z3::func_decl_vector &getQueries() { return Queries; }

  void initialize(Function &F);
  void extractConstraints(Instruction *I, z3::expr_vector &Assertions);
  void extractConstraints(BasicBlock *BB);
  void addQuery(z3::func_decl &Q) { Queries.push_back(Q); }
  z3::expr_vector transition(BasicBlock *BB, BasicBlock *Succ);

private:
  z3::context C;
  z3::fixedpoint *Solver;
  z3::params *Params;
  z3::check_result Result;
  z3::func_decl_vector Queries;
  std::map<BasicBlock *, std::set<Value *>> FreeVariables;
  std::map<BasicBlock *, z3::func_decl> BBRelations;
  std::map<BasicBlock *, z3::expr_vector> FreeVariableVector;
  z3::expr_vector AllVariableVector;
};

#endif // EXTRACTOR_H

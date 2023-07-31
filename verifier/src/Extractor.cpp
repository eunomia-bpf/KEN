#include "Extractor.h"

#include "llvm/IR/CFG.h"
#include "llvm/IR/Instruction.h"

#include "Utils.h"

/* Implement your extractor */
void Extractor::extractConstraints(Instruction *I,
                                   z3::expr_vector &Assertions) {
  /* Add your code here */

}

void Extractor::initialize(Function &F) { /* Add your code here */ }

z3::expr_vector Extractor::transition(BasicBlock *BB, BasicBlock *Succ) {
  z3::expr_vector Vec(C);
  /* Add your code here */
  return Vec;
}

void Extractor::extractConstraints(BasicBlock *BB) { 
  
}

.PRECIOUS: %.ll %.opt.ll

TARGETS=simple0 simple1 simple2

all: ${TARGETS}

%: %.c
	clang -emit-llvm -S -fno-discard-value-names -Xclang -disable-O0-optnone -c -o $@.ll $<
	opt -mem2reg -S $*.ll -o $*.opt.ll

clean:
	rm -f *.ll *.out *.err *.smt2 input.txt branch.txt ${TARGETS}

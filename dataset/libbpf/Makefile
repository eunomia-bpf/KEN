.DEFAULT_GOAL := build

CC := clang

ARCH := $(shell uname -m | sed -e 's/x86_64/x86/' -e 's/aarch64/arm64/')
DOCKER_PATH := /code/KEN/opencopilot/ebpf_vector_db/libbpf/
SRC_C = ${wildcard *.bpf.c}
SRC_LL = ${wildcard ./build/*.bpf.ll}
OBJ_O = ${patsubst %.bpf.c, %.bpf.o, $(SRC_C)}
OBJ_LL = ${patsubst %.bpf.c, %.bpf.ll, $(SRC_C)}
OBJ_SMT = ${patsubst %.bpf.ll, %.bpf.smt2, $(SRC_LL)}

# From https://github.com/libbpf/libbpf-bootstrap/blob/a7c0f7e4a28/examples/c/Makefile#L34-L43
# Get Clang's default includes on this system. We'll explicitly add these dirs
# to the includes list when compiling with `-target bpf` because otherwise some
# architecture-specific dirs will be "missing" on some architectures/distros -
# headers such as asm/types.h, asm/byteorder.h, asm/socket.h, asm/sockios.h,
# sys/cdefs.h etc. might be missing.
#
# Use '-idirafter': Don't interfere with include mechanics except where the
# build would have failed anyways.
CLANG_BPF_SYS_INCLUDES = $(shell $(CC) -v -E - </dev/null 2>&1 \
	| sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }')

$(OBJ_O): %.bpf.o: %.bpf.c ../include/$(ARCH)/vmlinux.h
	$(CC) -mcpu=v3 -g -O2 -Wall -Werror -D__TARGET_ARCH_$(ARCH) $(CFLAGS) $(CLANG_BPF_SYS_INCLUDES) -I../include/$(ARCH) -c -target bpf $< -o build/$@

$(OBJ_LL): %.bpf.ll: %.bpf.c ../include/$(ARCH)/vmlinux.h
	$(CC) -mcpu=v3 -S -emit-llvm -Xclang -no-opaque-pointers -Xclang -disable-llvm-passes -O3 -g -Wall -Werror -D__TARGET_ARCH_$(ARCH) $(CFLAGS) $(CLANG_BPF_SYS_INCLUDES) -I../include/$(ARCH) -target bpf $< -o build/$@

$(OBJ_SMT): %.bpf.smt2: %.bpf.ll ../include/$(ARCH)/vmlinux.h
	sudo docker exec d6c sea smt ${DOCKER_PATH}/$< -o ${DOCKER_PATH}/$@

.PHONY: clean
clean:
	rm -f build

.PHONY: build
build: $(OBJ_O) $(OBJ_LL) $(OBJ_SMT)

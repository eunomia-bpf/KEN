cmake_minimum_required(VERSION 3.10)

find_package(LLVM REQUIRED)
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(HandleLLVMOptions)
include(AddLLVM)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")

set(Z3_DIR $ENV{Z3_DIR})
get_filename_component(Z3_DIR ${Z3_DIR} ABSOLUTE)
set(Z3_CXX_INCLUDE_DIRS ${Z3_DIR}/include)
set(Z3_LIBRARIES ${Z3_DIR}/bin/libz3.so)
message(STATUS "Z3_DIR: ${Z3_DIR}")

add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS} include)
include_directories(${Z3_CXX_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS} ${CMAKE_CURRENT_BINARY_DIR})

add_executable(verifier
  src/Verifier.cpp
  src/Extractor.cpp
  src/Utils.cpp
  )

llvm_map_components_to_libnames(llvm_libs support core irreader)

target_link_libraries(verifier ${llvm_libs} ${Z3_LIBRARIES})

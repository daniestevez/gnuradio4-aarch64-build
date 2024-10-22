set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)
set(triple aarch64-unknown-linux-gnu)

set(CMAKE_C_COMPILER "clang-19")
set(CMAKE_C_COMPILER_TARGET ${triple})
set(CMAKE_CXX_COMPILER "clang++-19")
set(CMAKE_CXX_COMPILER_TARGET ${triple})

# Release build type
set(CMAKE_BUILD_TYPE Release CACHE STRING "Build configuration")

# DISRUPTOR_CPU_ARM is used in an #ifdef in gnuradio4
set(CMAKE_C_FLAGS " -DDISRUPTOR_CPU_ARM -O3 -march=armv8-a -mtune=cortex-a53 -stdlib=libc++ " CACHE STRING "CFLAGS")
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "CXXFLAGS")
set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS} -DNDEBUG" CACHE STRING "Release CFLAGS")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} -DNDEBUG" CACHE STRING "Release CXXFLAGS")
set(CMAKE_ASM_FLAGS_RELEASE "${CMAKE_ASM_FLAGS} -DNDEBUG" CACHE STRING "Release ASMFLAGS")
set(CMAKE_EXE_LINKER_FLAGS "-fuse-ld=lld -nostdlib++ -Wl,--push-state,-Bstatic -lc++ -Wl,--pop-state" CACHE STRING "LDFLAGS for executables")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "LDFLAGS for shared libraries")
set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "LDFLAGS for module libraries")

set(CMAKE_SYSROOT "/sysroot")
set(CMAKE_FIND_ROOT_PATH "/sysroot")
set(ENV{PKG_CONFIG_SYSROOT_DIR} "/sysroot")

# adjust the default behavior of the FIND_XXX() commands:
# search programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# search headers and libraries in the target environment
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_SYSTEM_PREFIX_PATH "/sysroot/usr")

#! /bin/bash
#
# Script to build RISC-V ISA simulator, proxy kernel, and GNU toolchain.

. build.common

echo "Starting RISC-V Toolchain build process"

build_project riscv-fesvr --prefix=$RISCV
build_project riscv-isa-sim --prefix=$RISCV --with-fesvr=$RISCV --with-isa=rv32imfdc
build_project riscv-gnu-toolchain --prefix=$RISCV --with-arch=rv32imfdc --with-abi=ilp32d
CC= CXX= build_project riscv-pk --prefix=$RISCV --host=riscv32-unknown-elf
build_project riscv-openocd --prefix=$RISCV --enable-remote-bitbang --disable-werror
#build_project riscv-tests --prefix=$RISCV/riscv32-unknown-elf --with-xlen=32

echo -e "\\nRISC-V Toolchain installation completed!"

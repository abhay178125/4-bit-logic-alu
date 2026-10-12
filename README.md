# 4-bit ALU using Verilog HDL

A beginner-friendly combinational Arithmetic Logic Unit (ALU) written in Verilog.

## Operations

| Opcode | Operation | Description |
|---|---|---|
| `000` | Addition | `A + B` |
| `001` | Subtraction | `A - B` |
| `010` | AND | Bitwise AND |
| `011` | OR | Bitwise OR |
| `100` | XOR | Bitwise XOR |
| `101` | NOT A | Bitwise inversion of A |
| `110` | Less-than | Returns `1` if A < B, otherwise `0` |
| `111` | Pass A | Output equals A |

Inputs `A` and `B` are 4 bits wide. The result is 4 bits wide. The `zero` output is high when the result is zero.

## Repository structure

```text
4-bit-ALU-Verilog/
├── README.md
├── rtl/
│   └── alu.v
├── testbench/
│   └── alu_tb.v
└── .gitignore
```

## Requirements

Install:
- Icarus Verilog
- GTKWave (optional, for waveform viewing)

## Run the testbench

From this project folder:

```bash
iverilog -g2012 -o alu_sim rtl/alu.v testbench/alu_tb.v
vvp alu_sim
```

Expected output includes `ALL ALU TESTS PASSED`.

## View waveforms (optional)

The included testbench writes `alu_wave.vcd`. Open it with:

```bash
gtkwave alu_wave.vcd
```

## Learning objectives

- Implement combinational logic using Verilog
- Use a `case` statement for opcode selection
- Write a simple self-checking testbench
- Simulate and inspect waveform results

## GitHub description

`A 4-bit Verilog ALU supporting arithmetic and bitwise operations, with a testbench and simulation waveform output.`

## Important

Run the simulation yourself and review the code before listing this project as completed on your resume or LinkedIn.

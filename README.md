# Binary Ones Counter

## Overview
This Verilog implementation provides a binary ones counter that counts the number of '1' bits in an 8-bit input value. The design uses a hierarchical approach with a ripple-carry adder architecture for efficient bit counting.

## Architecture

### Module Hierarchy
1. `count_ones` - Top-level module
2. `ripple_adder` - 4-bit ripple-carry adder
3. `fulladder` - Single-bit full adder

### Module Descriptions

#### 1. Full Adder (`fulladder`)
A combinational circuit that adds three single-bit inputs.

**Inputs:**
- `a`: First input bit
- `b`: Second input bit
- `cin`: Carry input

**Outputs:**
- `sum`: Sum output
- `cout`: Carry output

**Implementation:**
```verilog
assign sum = a^b^cin;
assign cout = a&b|b&cin|cin&a;
```

#### 2. Ripple Adder (`ripple_adder`)
A 4-bit adder implemented using four cascaded full adders.

**Inputs:**
- `a[3:0]`: First 4-bit input
- `b[3:0]`: Second 4-bit input
- `cin`: Carry input

**Outputs:**
- `s[3:0]`: 4-bit sum output
- `cout`: Carry output

**Implementation Details:**
- Uses four full adder instances connected in series
- Carry propagates from least significant to most significant bit
- Internal carries stored in `c[2:0]`

#### 3. Ones Counter (`count_ones`)
The main module that counts the number of '1' bits in an 8-bit input.

**Inputs:**
- `binary_in[7:0]`: 8-bit input value

**Outputs:**
- `ones_count[3:0]`: 4-bit output representing the count of '1' bits

**Implementation Strategy:**
1. Splits the 8-bit input into two 4-bit groups
2. Counts '1's in each group separately
3. Uses ripple adder to sum the counts

## Testbench

The testbench (`count_ones_tb`) provides comprehensive verification of the design.

### Test Cases
```
00000000 → 0 ones
11111111 → 8 ones
10101010 → 4 ones
11001100 → 4 ones
11100110 → 5 ones
10000001 → 2 ones
00100110 → 3 ones
00001111 → 4 ones
01010101 → 4 ones
```

### Testbench Features
- Uses `timescale 1ns/1ps`
- Generates VCD dump file for waveform viewing
- Monitors and displays input/output values
- Includes diverse test patterns

## Usage

### Simulation
1. Compile the design files:
   ```bash
   iverilog -o count_ones count_ones.v count_ones_tb.v
   ```
2. Run the simulation:
   ```bash
   vvp count_ones
   ```
3. View waveforms:
   ```bash
   gtkwave count_ones_tb.vcd
   ```

### Integration
To use this module in a larger design:
1. Include both `count_ones.v` and its dependencies
2. Instantiate the `count_ones` module with appropriate port connections
3. Connect 8-bit input and capture 4-bit output

## Performance Considerations

### Timing
- Maximum delay is determined by ripple-carry chain
- Total delay = 4 full adder delays + initial count preparation

### Area
- Uses basic logic gates (AND, OR, XOR)
- Contains 4 full adders
- Minimal control logic overhead

## Limitations and Considerations
1. Fixed 8-bit input size
2. Synchronous operation not implemented (purely combinational)
3. No error checking or input validation
4. Maximum count output is 8 (4-bit output sufficient)

## Future Improvements
1. Parameterized input width
2. Pipeline stages for higher throughput
3. Error checking capabilities
4. Synchronous operation option

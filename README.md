# `count_ones.v` - Verilog Module

## Module Name: `count_ones`

This module counts the number of `1`s in an 8-bit binary input.

### Ports
- **Inputs**:
  - `binary_in` (8-bit, input): The 8-bit binary input whose 1s are to be counted.

- **Outputs**:
  - `ones_count` (4-bit, output): The 4-bit output representing the count of 1s in `binary_in`.

### Functionality
The module computes the number of `1`s in the 8-bit input `binary_in`. The count of `1`s is generated using an arithmetic sum of each bit in `binary_in`:

assign ones_count = binary_in[0] + binary_in[1] + binary_in[2] + binary_in[3] +
                    binary_in[4] + binary_in[5] + binary_in[6] + binary_in[7];

### Example Usage
When `binary_in = 8'b11001100`, the `ones_count` will be `4` as there are four `1`s in the binary input.

---

# `count_ones_tb.v` - Testbench for `count_ones`

## Module Name: `count_ones_tb`

This testbench is used to verify the functionality of the `count_ones` module.

### Components
- **Signals**:
  - `binary_in` (8-bit, reg): Test input for the `binary_in` signal of the `count_ones` module.
  - `ones_count` (4-bit, wire): Observed output for the `ones_count` signal of the `count_ones` module.

- **Unit Under Test (UUT)**:
  - Instance of `count_ones` named `uut` with `binary_in` connected to `binary_in` and `ones_count` connected to `ones_count`.

### Test Procedure
1. The testbench generates a `VCD` waveform file (`count_ones_tb.vcd`) for viewing the simulation results.
2. The `$monitor` statement continuously displays the input `binary_in` and the output `ones_count` during the simulation.
3. Different binary values are applied to `binary_in` with a delay of `10 ns` between each to observe the results:
   - `binary_in = 8'b00000000` (Expected output: 0)
   - `binary_in = 8'b11111111` (Expected output: 8)
   - `binary_in = 8'b10101010` (Expected output: 4)
   - `binary_in = 8'b11001100` (Expected output: 4)
   - `binary_in = 8'b11100110` (Expected output: 5)
   - `binary_in = 8'b10000001` (Expected output: 2)
   - `binary_in = 8'b00100110` (Expected output: 3)
   - `binary_in = 8'b00001111` (Expected output: 4)
   - `binary_in = 8'b01010101` (Expected output: 4)

4. The simulation finishes after testing all the values with `$finish`.

### Simulation
To view the simulation results, run the testbench and open `count_ones_tb.vcd` in a waveform viewer to check that `ones_count` accurately reflects the number of 1s in `binary_in` for each test case.

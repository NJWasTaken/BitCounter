# Binary Ones Counter
A Verilog implementation of a circuit that counts the number of '1' bits in an 8-bit input value using a hierarchical approach with a ripple-carry adder architecture.

## 👥 Team Members
| Sl. No | Name |
|--------|------|
| 1 | Prateek P. |
| 2 | Noel Jose |
| 3 | Paranshu Raj |
| 4 | Vivian P. V. |

## 🎯 Project Overview
This project implements a binary ones counter using Verilog HDL. The design efficiently counts the number of '1' bits in an 8-bit input value using a Ripple Carry Adder (RCA) architecture. The implementation is modular, using multiple full-adder instances connected in series.

## 🔄 Algorithm
1. **Input Processing**
   - Accept an 8-bit input value
   - Split the input into two 4-bit groups

2. **Counting Process**
   - Count 1's in each group separately
   - Use ripple adder to sum the counts from both groups

3. **Output Generation**
   - Generate final count of ones in the input

## ⚡ Implementation Details

### Components

1. **Full Adder Module**
```verilog
module fulladder(
    input a, b, cin,
    output sum, cout
);
    assign sum = a^b^cin;
    assign cout = a&b|b&cin|cin&a;
endmodule
```

2. **Ripple Adder Module**
```verilog
module ripple_adder(
    input wire [3:0]a,
    input wire [3:0]b,
    input wire cin,
    output wire [3:0]s,
    output wire cout
);
    wire [2:0]c;
    fulladder f1(a[0],b[0],cin,s[0],c[0]);
    fulladder f2(a[1],b[1],c[0],s[1],c[1]);
    fulladder f3(a[2],b[2],c[1],s[2],c[2]);
    fulladder f4(a[3],b[3],c[2],s[3],cout);
endmodule
```

3. **Main Counter Module**
```verilog
module count_ones(
    input [7:0] binary_in,
    output [3:0] ones_count
);
    // Implementation details...
endmodule
```

## 🧪 Test Cases
| Input | Expected Output |
|-------|----------------|
| 00000000 | 0 ones |
| 11111111 | 8 ones |
| 10101010 | 4 ones |
| 11001100 | 4 ones |
| 11100110 | 5 ones |
| 10000001 | 2 ones |
| 00100110 | 4 ones |
| 00001111 | 4 ones |
| 01010101 | 4 ones |

## 🛠️ Usage

1. Clone the repository
```bash
git clone https://github.com/NJWasTaken/BitCounter.git
```

2. Run the testbench using iverilog
```bash
iverilog -o testbench.vvp count_ones_tb.v
vvp testbench.vvp
```

3. View waveforms using GTKWave
```bash
gtkwave count_ones_tb.vcd
```

## 📊 Features
- Efficient bit counting using ripple-carry adder architecture
- Modular design with separate full adder instances
- Comprehensive testbench with multiple test cases
- Easy-to-understand hierarchical implementation
- Waveform visualization support

---
*This project was developed as part of the DDCO Mini Project (3rd Semester, D-Section)*

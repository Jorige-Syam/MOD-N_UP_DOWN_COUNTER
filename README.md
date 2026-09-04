# MOD-N Up/Down Counter using Verilog HDL

## Project Overview

This project implements a MOD-N Up/Down Counter using Verilog HDL.

The counter can count in both upward and downward directions depending on the `up_down` control signal. It also includes a synchronous reset and automatic wrap-around.

For this project:

- N = 10
- Counter Width = 4 bits

## Features

- Up counting and Down counting
- Synchronous reset
- Automatic wrap-around
- Parameterized counter size
- Synthesizable Verilog RTL
- Verilog testbench for verification
- Simulation using QuestaSim

## Tools Used

- GVim – Used for writing and editing Verilog HDL code
- QuestaSim – Used for simulation and waveform analysis
- Verilog HDL – Used for RTL design and verification

## Project Files

```text
MOD-N-Up-Down-Counter/
│
├── modn_updown_counter.v
├── testbench.v
└── README.md
```

### modn_updown_counter.v

This file contains the main RTL design of the MOD-N Up/Down Counter.

### testbench.v

This file contains the Verilog testbench used to verify the counter.

## Inputs and Outputs

| Signal | Direction | Description |
|--------|-----------|-------------|
| `clk` | Input | Clock signal |
| `rst` | Input | Synchronous reset |
| `up_down` | Input | 1 = Up counting, 0 = Down counting |
| `count` | Output | Current counter value |

## Working Principle

The counter operates on the positive edge of the clock.

### Reset

When `rst = 1`, the counter is reset to zero.

```text
count = 0
```

### Up Counting

When `up_down = 1`, the counter increments by 1.

For N = 10:

```text
0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9 → 0
```

After reaching 9, the counter automatically returns to 0.

### Down Counting

When `up_down = 0`, the counter decrements by 1.

```text
9 → 8 → 7 → 6 → 5 → 4 → 3 → 2 → 1 → 0 → 9
```

After reaching 0, the counter automatically returns to 9.

## Verification

The testbench checks the following operations:

- Reset operation
- Up counting
- Up-count wrap-around
- Down counting
- Down-count wrap-around
- Reset during counting

The design was simulated using QuestaSim and the waveform was checked to verify the expected counter behavior.

## Simulation Result

The simulation waveform contains:

- Clock (`clk`)
- Reset (`rst`)
- Up/Down control (`up_down`)
- Counter output (`count`)

The waveform confirms the correct MOD-10 up and down counting operation.

## Example

### Up Counting

```text
0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9 → 0
```

### Down Counting

```text
9 → 8 → 7 → 6 → 5 → 4 → 3 → 2 → 1 → 0 → 9
```

## Learning Outcomes

Through this project, I gained practical experience in:

- Verilog HDL
- RTL Design
- Sequential Logic
- Counter Design
- Parameterized Designs
- Testbench Development
- Functional Verification
- Simulation and Waveform Analysis

## Future Improvements

This project can be extended by:

- Adding enable functionality
- Adding a programmable MOD value
- Adding a terminal-count output
- Creating a more advanced verification environment
- Implementing the design on an FPGA

## Author

**Jorige Syam**

Interested in:

- RTL Design
- VLSI
- Digital Design
- Verilog HDL
- Functional Verification

## License

This project is created for educational and learning purposes.

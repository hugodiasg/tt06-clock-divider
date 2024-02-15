<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works
This design is a clock divider. It receives a byte at its input (scale {ui_in[7:0]}), calculates true_scale = scale*CONST (CONST = 258000) and the clock frequency at the input is divided (clk_out {uo_out[0]} = clk_in {clk} / true_scale). If the scale is set to 0, the clk_in is just repeated at the clk_out. With scale = 1111_1111, it is possible to achieve true_scale ≈ 66e6.

## How to test

- scale = choose a byte
- connect clk_in to a clock signal
- do the nrst to reset
- observe the clock signal with the frequency divided into clk_out

## External hardware

List external hardware used in your project (e.g. PMOD, LED display, etc), if any

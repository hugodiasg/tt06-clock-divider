# SPDX-FileCopyrightText: © 2023 Uri Shaked <uri@tinytapeout.com>
# SPDX-License-Identifier: MIT

import cocotb
from cocotb.clock import Clock
#from cocotb.triggers import ClockCycles
from cocotb.triggers import ClockCycles, RisingEdge

@cocotb.test()
async def test_adder(dut):
  dut._log.info("Start")
  
  # Our example module doesn't use clock and reset, but we show how to use them here anyway.
  clock = Clock(dut.clk, 10, units="us")
  cocotb.start_soon(clock.start())

  # Reset
  dut._log.info("Reset")
  dut.ena.value = 1
  dut.ui_in.value = 0
  dut.uio_in.value = 0
  dut.rst_n.value = 0
  dut.ui_in.value = 0b0001
  await ClockCycles(dut.clk, 10)
  dut.rst_n.value = 1

  # X -> Set the input values, wait one clock cycle, and check the output
  # Set the input values, wait (200_000 * dut.ui_in.value) clock cycles, and check the output
  dut._log.info("Test")
  #dut.ui_in.value = 20
  #dut.ui_in.value = 1
  #dut.uio_in.value = 30

  #await ClockCycles(dut.clk, 1)
  #await ClockCycles(dut.clk, 200000)

  #assert dut.uo_out.value == 50
  cycles = 0
  while True:
    await ClockCycles(dut.clk,1)
    if dut.uo_out[0] == 1:
      break
    cycles += 1
  print(f"took {cycles} cycles")
  assert cycles == 100
  #ClockCycles(dut.clk, 2000)
  #assert dut.uo_out.value == "00000001"


module tt_um_hugodg_clock_divider (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    // Ports section
  reg nrst;
  wire [7:0] scale;
  wire clk_out; 

  // Assign inputs, outputs, bidirectional
  // dedicated outputs
  assign uo_out[0] = clk_out;
  
  // reset
  assign rst_n = nrst;
  
  // inputs
  assign ui_in[7:0] = scale[7:0];
  
  clock_divider clock_divider_inst(
    .clk_in(clk),
    .nrst(nrst),
    .scale(ui_in[7:0]),
    .clk_out(clk_out)
  );
endmodule

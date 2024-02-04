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

// unused ports
assign uio_out[7] = 0;  /* uio[7]: unused port grounded */
assign uio_oe[7:0] = 8'b0;  /* uio[7]: unused port set */
assign uo_out[7:1] = 0;  /* uo[7]: unused port grounded */
    
clock_divider clock_divider_inst(
    .clk_in(clk),
    .nrst(rst_n),
    .scale(ui_in[7:0]),
    .clk_out(uo_out[0])
  );
endmodule

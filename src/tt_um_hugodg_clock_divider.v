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
reg clk_in;
reg nrst;
wire [7:0] scale;
wire clk_out; 

// Assign inputs, outputs, bidirectional
// dedicated outputs
assign uo_out[0] = clk_out;
  
// reset
assign nrst = n_rst;
  
// inputs and clock
assign scale[7:0] = ui_in[7:0];
assign clk_in = clk;

// unused ports
assign uio_out[7] = 0;  /* uio[7]: unused port grounded */
assign uio_oe[7] = 8'b0;  /* uio[7]: unused port set */
assign uo_out[7:1] = 0;  /* uo[7]: unused port grounded */
    
clock_divider clock_divider_inst(
    .clk_in(clk),
    .nrst(nrst),
    .scale(ui_in[7:0]),
    .clk_out(clk_out)
  );
endmodule

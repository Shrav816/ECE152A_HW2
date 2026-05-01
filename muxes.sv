module muxes (
  input a_i, b_i, c_i, d_i,
  input logic [1:0] sel4_i,
  output logic y0_o, y1_o
);
  
always_comb begin
  if (a_i ^ b_i == 1) begin
    y0_o = d_i;
  end else begin
    y0_o = c_i;
  end
end
  
always_comb begin
  case (sel4_i) 
	0: y1_o = 0;
    1: y1_o = c_i;
    2: y1_o = 0;
    3: y1_o = d_i;
	default: y1_o = 0;
  endcase
end
 
endmodule

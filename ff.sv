module ff_reference #(
	parameter WIDTH = 4
                      )(
  input clk, rst,
  input logic [WIDTH-1:0] data_i,
  output logic [WIDTH-1:0] data_o
);
  
  logic [WIDTH-1:0] data_d1, data_q1;
  logic [WIDTH-1:0] data_d2, data_q2;
  logic [WIDTH-1:0] data_d3, data_q3;
  assign data_o = data_q3;
  
 always_comb begin : data_set1
   // data_d is set by combinational logic
   data_d1 = data_i;
 end
  
 // async reset
  always_ff @(posedge clk or posedge rst) begin : data_ff1
    if (rst) begin
      data_q1 <= '0;
    end else begin
      data_q1 <= data_d1;
    end
  end
  
 always_comb begin : data_set2
   // data_d is set by combinational logic
   data_d2 = data_q1;
 end
  
 // async reset
  always_ff @(posedge clk or posedge rst) begin : data_ff2
    if (rst) begin
      data_q2 <= '0;
    end else begin
      data_q2 <= data_d2;
    end
  end
  
 always_comb begin : data_set3
   // data_d is set by combinational logic
   data_d3 = data_q2;
 end
  
 // async reset
  always_ff @(posedge clk or posedge rst) begin : data_ff3
    if (rst) begin
      data_q3 <= '0;
    end else begin
      data_q3 <= data_d3;
    end
  end
 
  endmodule

module mux_2x1(input logic [7:0]a,b,input logic s, output logic [7:0]y);
  assign y=s?b:a;
endmodule

`timescale 1ns / 1ps

`define clk_period 1000000

module traffic_light_tb();

reg clk;
reg rst;
wire [2:0] light_A;
wire [2:0] light_B;

traffic_light TRAFFIC_LIGHT(
    .clk(clk),
    .rst(rst),
    .light_A(light_A),
    .light_B(light_B)
);

initial clk = 1;
always #(`clk_period/2) clk = ~clk;

initial begin
    rst = 0;
    #`clk_period;

    rst=1;
    #`clk_period;

    rst=0;
    #(`clk_period * 200);

    $stop;

end

endmodule
`default_nettype none

module top (
	
    // ftdi 245 fifo signals
    output reg  [7:0] data,
    //input  wire rx_empty,
    input  wire tx_full,
    output reg  read_n,
    output reg  write_n,
    output reg  send_immediately_n,
    input  wire clock_60mhz,
    output reg  output_enable_n,
	
    // status leds
    output reg power_led_n,
    output reg tx_active_led_n
	
);

reg [7:0] counter;
	
always @(posedge clock_60mhz) begin
	
    power_led_n <= 1;
    output_enable_n <= 1;
    send_immediately_n <= 1;
	
    if(!tx_full) begin
        write_n <= 0;
        data <= counter;
        tx_active_led_n <= 0;
        counter <= counter + 1;
    end else begin
        write_n <= 1;
        read_n <= 1;
        tx_active_led_n <= 1;
    end
	
end

endmodule

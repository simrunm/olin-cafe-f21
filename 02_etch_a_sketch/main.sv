`default_nettype none // Overrides default behaviour (in a good way)

/*
  Starter module for the etch-a-sketch lab.
*/

module main(
  // On board signals
  clk, buttons, leds, rgb,
  // Display signals
  interface_mode,
  touch_i2c_scl, touch_i2c_sda, touch_irq,
  backlight, display_rstb, data_commandb,
  display_csb, spi_mosi, spi_miso, spi_clk
);
parameter CLK_HZ = 12_000_000; // aka ticks per second
parameter CLK_PERIOD_NS = (1_000_000_000/CLK_HZ); // Approximation.
parameter PWM_PERIOD_US = 100; 
parameter PWM_WIDTH = 4;
parameter PERIOD_MS_FADE = 100;
parameter PWM_TICKS = CLK_HZ*PWM_PERIOD_US/1_000_000; //1kHz modulation frequency. // Always multiply before dividing, it avoids truncation.
parameter human_divider = 23; // A clock divider parameter - 12 MHz / 2^23 is about 1 Hz (human visible speed).

//Module I/O and parameters
input wire clk;
input wire [1:0] buttons;
logic rst; always_comb rst = buttons[0]; // Use button 0 as a reset signal.
output logic [1:0] leds;
output logic [2:0] rgb;

// Display driver signals
output wire [3:0] interface_mode;
output wire touch_i2c_scl;
inout wire touch_i2c_sda;
input wire touch_irq;
output wire backlight, display_rstb, data_commandb;
output wire display_csb, spi_clk, spi_mosi;
input wire spi_miso;


// Some useful timing signals.
wire step_1Hz;
pulse_generator #(.N($clog2(CLK_HZ/1))) PULSE_1Hz (
  .clk(clk), .rst(rst), .ena(1'b1), .out(step_1Hz),
  .ticks(CLK_HZ/1)
);

wire step_10Hz;
pulse_generator #(.N($clog2(CLK_HZ/10))) PULSE_10Hz (
  .clk(clk), .rst(rst), .ena(1'b1), .out(step_10Hz),
  .ticks(CLK_HZ/10)
);

wire step_100Hz;
pulse_generator #(.N($clog2(CLK_HZ/100))) PULSE_100Hz (
  .clk(clk), .rst(rst), .ena(1'b1), .out(step_100Hz),
  .ticks(CLK_HZ/100)
);

wire step_1kHz;
pulse_generator #(.N($clog2(CLK_HZ/1000))) PULSE_1kHz (
  .clk(clk), .rst(rst), .ena(1'b1), .out(step_1kHz),
  .ticks(CLK_HZ/1000)
);

wire step_10kHz;
pulse_generator #(.N($clog2(CLK_HZ/10_000))) PULSE_10kHz (
  .clk(clk), .rst(rst), .ena(1'b1), .out(step_10kHz),
  .ticks(CLK_HZ/10_000)
);

wire step_100kHz;
pulse_generator #(.N($clog2(CLK_HZ/100_000))) PULSE_100kHz (
  .clk(clk), .rst(rst), .ena(1'b1), .out(step_100kHz),
  .ticks(CLK_HZ/100_000)
);

// LED PWM logic.
logic [PWM_WIDTH-1:0] led_pwm0, led_pwm1;

pwm #(.N(PWM_WIDTH)) PWM_LED0 (
  .clk(clk), .rst(rst), .ena(1'b1), .step(1'b1), .duty(led_pwm0),
  .out(leds[0])
);

pwm #(.N(PWM_WIDTH)) PWM_LED1 (
  .clk(clk), .rst(rst), .ena(1'b1), .step(1'b1), .duty(led_pwm1),
  .out(leds[1])
);

triangle_generator #(.N(PWM_WIDTH)) LED_FADER0 (
  .clk(clk), .rst(rst), .ena(step_10Hz), .out(led_pwm0)
);

triangle_generator #(.N(PWM_WIDTH)) LED_FADER (
  .clk(clk), .rst(rst), .ena(step_100Hz), .out(led_pwm1)
);


endmodule

`default_nettype wire // reengages default behaviour, needed when using 
                      // other designs that expect it.
set_time_format -unit ns -decimal_places 3
# ##############################################################################  Create Input reference clocks
create_clock -name "clock_50" -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]
create_clock -name "temporal123" -period 20.000 -waveform { 0.000 10.000 } [get_ports {AUD_BCLK}]
# ##############################################################################  Now that we have created the custom clocks which will be base clocks,#  derive_pll_clock is used to calculate all remaining clocks for PLLs
derive_pll_clocks -create_base_clocks
derive_clock_uncertainty
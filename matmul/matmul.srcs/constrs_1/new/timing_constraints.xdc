# Định nghĩa Clock 100MHz (Chu kỳ 10ns) cho cổng đầu vào tên là 'clk'
create_clock -period 10.000 -name sys_clk -waveform {0.000 5.000} [get_ports clk]
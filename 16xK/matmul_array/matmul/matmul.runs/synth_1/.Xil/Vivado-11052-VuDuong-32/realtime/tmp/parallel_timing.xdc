#
# Created by 
#   realTimeFpga.exe  on Sun Apr  5 21:18:53 2026
# (c) Xilinx, Inc.
#
# define clock clk_pl_0
create_clock -period 10.000000 -waveform {0.000000 5.000000} -name clk_pl_0 [get_xlnx_outside_genome_inst_pin 87 2560]
# define clock clk_pl_1
create_clock -period 10.000000 -waveform {0.000000 5.000000} -name clk_pl_1 [get_xlnx_outside_genome_inst_pin 87 2561]
# define clock constraints clk_pl_0
set_clock_uncertainty -from [get_clocks clk_pl_0] -to [get_clocks clk_pl_0] -setup -hold 0
# define clock constraints clk_pl_1
set_clock_uncertainty -from [get_clocks clk_pl_1] -to [get_clocks clk_pl_1] -setup -hold 0
# exception 0
set_false_path -to [list [get_xlnx_outside_genome_inst_pin 87 2593] [get_xlnx_outside_genome_inst_pin 87 2592] [get_xlnx_outside_genome_inst_pin 87 2591] [get_xlnx_outside_genome_inst_pin 87 2590] [get_xlnx_outside_genome_inst_pin 87 2589] [get_xlnx_outside_genome_inst_pin 87 2588] [get_xlnx_outside_genome_inst_pin 87 2587] [get_xlnx_outside_genome_inst_pin 87 2586] [get_xlnx_outside_genome_inst_pin 87 2585] [get_xlnx_outside_genome_inst_pin 87 2584] [get_xlnx_outside_genome_inst_pin 87 2583] [get_xlnx_outside_genome_inst_pin 87 2582] [get_xlnx_outside_genome_inst_pin 87 2581] [get_xlnx_outside_genome_inst_pin 87 2580] [get_xlnx_outside_genome_inst_pin 87 2579] [get_xlnx_outside_genome_inst_pin 87 2578] [get_xlnx_outside_genome_inst_pin 87 2577] [get_xlnx_outside_genome_inst_pin 87 2576] [get_xlnx_outside_genome_inst_pin 87 2575] [get_xlnx_outside_genome_inst_pin 87 2574] [get_xlnx_outside_genome_inst_pin 87 2573] [get_xlnx_outside_genome_inst_pin 87 2572] [get_xlnx_outside_genome_inst_pin 87 2571] [get_xlnx_outside_genome_inst_pin 87 2570] [get_xlnx_outside_genome_inst_pin 87 2569] [get_xlnx_outside_genome_inst_pin 87 2568] [get_xlnx_outside_genome_inst_pin 87 2567] [get_xlnx_outside_genome_inst_pin 87 2566] [get_xlnx_outside_genome_inst_pin 87 2565] [get_xlnx_outside_genome_inst_pin 87 2564] [get_xlnx_outside_genome_inst_pin 87 2563] [get_xlnx_outside_genome_inst_pin 87 2562]]
# exception 1
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 10992]
# exception 2
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 10993]
# exception 3
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 10994]
# exception 4
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 10995]
# exception 5
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 10996]
# exception 6
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 10997]
# exception 7
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 10998]
# exception 8
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 10999]
# exception 9
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11000]
# exception 10
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11001]
# exception 11
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11002]
# exception 12
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11003]
# exception 13
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11004]
# exception 14
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11005]
# exception 15
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11006]
# exception 16
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11007]
# exception 17
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11008]
# exception 18
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11009]
# exception 19
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11010]
# exception 20
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11011]
# exception 21
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11012]
# exception 22
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11013]
# exception 23
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11014]
# exception 24
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11015]
# exception 25
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11016]
# exception 26
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11017]
# exception 27
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11018]
# exception 28
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11019]
# exception 29
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11020]
# exception 30
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11021]
# exception 31
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11022]
# exception 32
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11023]
# exception 33
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11024]
# exception 34
set_false_path -through [get_xlnx_outside_genome_inst_pin 7 11783]
# exception 35
set_false_path -through [get_xlnx_outside_genome_inst_pin 8 10936]
# exception 36
set_false_path -through [get_xlnx_outside_genome_inst_pin 8 10937]
# exception 37
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11025]
# exception 38
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11026]
# exception 39
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11027]
# exception 40
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11028]
# exception 41
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11029]
# exception 42
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11030]
# exception 43
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11031]
# exception 44
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11032]
# exception 45
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11033]
# exception 46
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11034]
# exception 47
set_false_path -through [get_xlnx_outside_genome_inst_pin 13 11783]
# exception 48
set_false_path -through [get_xlnx_outside_genome_inst_pin 14 10936]
# exception 49
set_false_path -through [get_xlnx_outside_genome_inst_pin 14 10937]
# exception 50
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11035]
# exception 51
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11036]
# exception 52
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11037]
# exception 53
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11038]
# exception 54
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11039]
# exception 55
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11040]
# exception 56
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11041]
# exception 57
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11042]
# exception 58
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11043]
# exception 59
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11044]
# exception 60
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11045]
# exception 61
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11046]
# exception 62
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11047]
# exception 63
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11048]
# exception 64
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11049]
# exception 65
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11050]
# exception 66
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11051]
# exception 67
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11052]
# exception 68
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11053]
# exception 69
set_false_path -through [get_xlnx_outside_genome_inst_pin 15 11054]
# exception 70
set_false_path -through [get_xlnx_outside_genome_inst_pin 24 27785]
# exception 71
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13191]
# exception 72
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13192]
# exception 73
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13193]
# exception 74
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13194]
# exception 75
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13195]
# exception 76
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13196]
# exception 77
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13197]
# exception 78
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13198]
# exception 79
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13199]
# exception 80
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13200]
# exception 81
set_false_path -through [get_xlnx_outside_genome_inst_pin 34 33374]
# exception 82
set_false_path -through [get_xlnx_outside_genome_inst_pin 35 4487]
# exception 83
set_false_path -through [get_xlnx_outside_genome_inst_pin 40 2174]
# exception 84
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13201]
# exception 85
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13202]
# exception 86
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13203]
# exception 87
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13204]
# exception 88
set_false_path -through [get_xlnx_outside_genome_inst_pin 50 33374]
# exception 89
set_false_path -through [get_xlnx_outside_genome_inst_pin 51 4487]
# exception 90
set_false_path -through [get_xlnx_outside_genome_inst_pin 56 2174]
# exception 91
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13205]
# exception 92
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13206]
# exception 93
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13207]
# exception 94
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13208]
# exception 95
set_false_path -through [get_xlnx_outside_genome_inst_pin 66 32966]
# exception 96
set_false_path -through [get_xlnx_outside_genome_inst_pin 67 6355]
# exception 97
set_false_path -through [get_xlnx_outside_genome_inst_pin 72 2175]
# exception 98
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13209]
# exception 99
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13210]
# exception 100
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13211]
# exception 101
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13212]
# exception 102
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13213]
# exception 103
set_false_path -through [get_xlnx_outside_genome_inst_pin 73 13214]
# exception 104
set_false_path -to [get_xlnx_outside_genome_inst_pin 15 11055]
# exception 105
set_false_path -to [get_xlnx_outside_genome_inst_pin 15 11056]
# exception 106
set_false_path -to [get_xlnx_outside_genome_inst_pin 73 13215]
# exception 107
set_false_path -to [get_xlnx_outside_genome_inst_pin 73 13216]
# exception 108
set_false_path -to [get_xlnx_outside_genome_inst_pin 87 2594]
# exception 109
set_false_path -to [get_xlnx_outside_genome_inst_pin 87 2595]
# exception 110
set_false_path -to [get_xlnx_outside_genome_inst_pin 87 2596]
# exception 111
set_false_path -to [get_xlnx_outside_genome_inst_pin 87 2597]
# exception 112
set_false_path -to [get_xlnx_outside_genome_inst_pin 87 2598]
# exception 113
set_false_path -to [get_xlnx_outside_genome_inst_pin 87 2599]

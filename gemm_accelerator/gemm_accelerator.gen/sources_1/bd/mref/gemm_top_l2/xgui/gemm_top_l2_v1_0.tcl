# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ADDR_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BRAM_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DIM_W" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FIFO_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "K_BLK" -parent ${Page_0}
  ipgui::add_param $IPINST -name "M_BLK" -parent ${Page_0}
  ipgui::add_param $IPINST -name "N" -parent ${Page_0}
  ipgui::add_param $IPINST -name "N_BLK" -parent ${Page_0}


}

proc update_PARAM_VALUE.ADDR_W { PARAM_VALUE.ADDR_W } {
	# Procedure called to update ADDR_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_W { PARAM_VALUE.ADDR_W } {
	# Procedure called to validate ADDR_W
	return true
}

proc update_PARAM_VALUE.BRAM_DEPTH { PARAM_VALUE.BRAM_DEPTH } {
	# Procedure called to update BRAM_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BRAM_DEPTH { PARAM_VALUE.BRAM_DEPTH } {
	# Procedure called to validate BRAM_DEPTH
	return true
}

proc update_PARAM_VALUE.DIM_W { PARAM_VALUE.DIM_W } {
	# Procedure called to update DIM_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DIM_W { PARAM_VALUE.DIM_W } {
	# Procedure called to validate DIM_W
	return true
}

proc update_PARAM_VALUE.FIFO_DEPTH { PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to update FIFO_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIFO_DEPTH { PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to validate FIFO_DEPTH
	return true
}

proc update_PARAM_VALUE.K_BLK { PARAM_VALUE.K_BLK } {
	# Procedure called to update K_BLK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.K_BLK { PARAM_VALUE.K_BLK } {
	# Procedure called to validate K_BLK
	return true
}

proc update_PARAM_VALUE.M_BLK { PARAM_VALUE.M_BLK } {
	# Procedure called to update M_BLK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_BLK { PARAM_VALUE.M_BLK } {
	# Procedure called to validate M_BLK
	return true
}

proc update_PARAM_VALUE.N { PARAM_VALUE.N } {
	# Procedure called to update N when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.N { PARAM_VALUE.N } {
	# Procedure called to validate N
	return true
}

proc update_PARAM_VALUE.N_BLK { PARAM_VALUE.N_BLK } {
	# Procedure called to update N_BLK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.N_BLK { PARAM_VALUE.N_BLK } {
	# Procedure called to validate N_BLK
	return true
}


proc update_MODELPARAM_VALUE.N { MODELPARAM_VALUE.N PARAM_VALUE.N } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N}] ${MODELPARAM_VALUE.N}
}

proc update_MODELPARAM_VALUE.M_BLK { MODELPARAM_VALUE.M_BLK PARAM_VALUE.M_BLK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_BLK}] ${MODELPARAM_VALUE.M_BLK}
}

proc update_MODELPARAM_VALUE.N_BLK { MODELPARAM_VALUE.N_BLK PARAM_VALUE.N_BLK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N_BLK}] ${MODELPARAM_VALUE.N_BLK}
}

proc update_MODELPARAM_VALUE.K_BLK { MODELPARAM_VALUE.K_BLK PARAM_VALUE.K_BLK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.K_BLK}] ${MODELPARAM_VALUE.K_BLK}
}

proc update_MODELPARAM_VALUE.ADDR_W { MODELPARAM_VALUE.ADDR_W PARAM_VALUE.ADDR_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_W}] ${MODELPARAM_VALUE.ADDR_W}
}

proc update_MODELPARAM_VALUE.DIM_W { MODELPARAM_VALUE.DIM_W PARAM_VALUE.DIM_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DIM_W}] ${MODELPARAM_VALUE.DIM_W}
}

proc update_MODELPARAM_VALUE.FIFO_DEPTH { MODELPARAM_VALUE.FIFO_DEPTH PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_DEPTH}] ${MODELPARAM_VALUE.FIFO_DEPTH}
}

proc update_MODELPARAM_VALUE.BRAM_DEPTH { MODELPARAM_VALUE.BRAM_DEPTH PARAM_VALUE.BRAM_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BRAM_DEPTH}] ${MODELPARAM_VALUE.BRAM_DEPTH}
}


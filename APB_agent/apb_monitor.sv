//APB_MONITOR
class apb_monitor extends uvm_monitor;

	`uvm_component_utils(apb_monitor)
	
 	uvm_analysis_port #(apb_trans) monitor_port;

	function new(string name = "apb_monitor", uvm_component parent = null);
		super.new(name,parent);
		monitor_port = new("monitor_port", this);
	endfunction

endclass


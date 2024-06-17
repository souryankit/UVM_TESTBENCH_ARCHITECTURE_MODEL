//MONITOR
class ahb_monitor extends uvm_monitor;

	`uvm_component_utils(ahb_monitor)
	   
 	uvm_analysis_port #(ahb_trans) monitor_port;

	function new(string name = "ahb_monitor", uvm_component parent = null);
		super.new(name,parent);
		monitor_port = new("monitor_port", this);
	endfunction

endclass

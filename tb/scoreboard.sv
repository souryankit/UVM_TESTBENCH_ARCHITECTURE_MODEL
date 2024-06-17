//SCOREBOARD
class scoreboard extends uvm_scoreboard;

  	uvm_tlm_analysis_fifo #(uvm_sequence_item) fifo1;
  	uvm_tlm_analysis_fifo #(uvm_sequence_item) fifo2;

  	`uvm_component_utils(scoreboard)

	 function new(string name = "scoreboard", uvm_component parent = null);
  		super.new(name,parent);
		fifo1 = new("fifo1",this);
		fifo2 = new("fifo2", this);
   	 endfunction

endclass



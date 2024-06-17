//DRIVER
class apb_driver extends uvm_driver #(apb_trans);

	`uvm_component_utils(apb_driver)
	

	function new(string name = "apb_driver", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	task run_phase(uvm_phase phase);
		//super.run_phase(phase);
		forever
		begin
		     seq_item_port.get_next_item(req);
		     send_to_dut(req);
		     seq_item_port.item_done();
		end
	endtask	

	task send_to_dut(apb_trans xtn);
		`uvm_info(get_type_name(),"APB-DRIVER Transaction Printing..",UVM_LOW)
		xtn.print();
	endtask


endclass


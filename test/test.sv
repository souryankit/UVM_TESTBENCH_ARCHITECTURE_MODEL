//AHB_APB_BRIDGE_TEST_CLASS_LIB
class base_test extends uvm_test;
 `uvm_component_utils(base_test)

  env envh;
  env_config m_cfg;
  
  ahb_agent_config ahb_cfg[];
  apb_agent_config apb_cfg[];

  bit has_apb_agent = 1;
  bit has_ahb_agent = 1;
  bit has_scoreboard = 1;
  int no_of_ahb_agent = 1;
  int no_of_apb_agent = 1;
  
  function new(string name = "base_test", uvm_component parent = null);
  	super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	m_cfg = env_config::type_id::create("m_cfg");

/*
        if(!uvm_config_db#(virtual input_if)::get(this,"","ip_vif",m_cfg.in_vif))
		`uvm_fatal(get_type_name(),"Error in getting Input interface in agent.")
	
	if(!uvm_config_db#(virtual output_if)::get(this,"","ip_vif",m_cfg.op_vif))
		`uvm_fatal(get_type_name(),"Error in getting Input interface in agent.")
*/

	if(has_ahb_agent) begin
		ahb_cfg = new[no_of_ahb_agent];
		m_cfg.ahb_cfg = new[no_of_ahb_agent];

		foreach(ahb_cfg[i]) begin
		ahb_cfg[i] = ahb_agent_config::type_id::create($sformatf("ahb_cfg[%0d]",i));
		//uvm_config_db#(virtual ahb_if)::set(this,($sformatf("ahb_cfg[%0d]",i),ahb_cfg[i].ahb_vif))
		m_cfg.ahb_cfg[i] = ahb_cfg[i];
		end
	end

	if(has_apb_agent) begin
		apb_cfg = new[no_of_apb_agent];
        	m_cfg.apb_cfg = new[no_of_apb_agent];

		foreach(apb_cfg[i]) begin
		apb_cfg[i] = apb_agent_config::type_id::create($sformatf("apb_cfg[%0d]",i));
		//uvm_config_db#(virtual apb_if)::get(this,"","apb_vif",apb_cfg[i].apb_vif))
		m_cfg.apb_cfg[i] = apb_cfg[i];
		end
	end
	
 	 m_cfg.has_ahb_agent = has_ahb_agent;
  	 m_cfg.has_apb_agent = has_apb_agent;
  	 m_cfg.has_scoreboard = has_scoreboard;
  	 m_cfg.no_of_ahb_agent = no_of_ahb_agent;
  	 m_cfg.no_of_apb_agent = no_of_apb_agent;

	uvm_config_db#(env_config)::set(this,"*","env_config",m_cfg);
	
	envh = env::type_id::create("envh", this);


  endfunction
 
function void end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction

endclass

class test1 extends base_test;

	`uvm_component_utils(test1)
	
	ahb_sequence ahb_seqh;
	apb_sequence apb_seqh;


  	function new(string name = "test1", uvm_component parent = null);
  		super.new(name,parent);
  	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ahb_seqh = ahb_sequence::type_id::create("ahb_seqh");
		apb_seqh = apb_sequence::type_id::create("apb_seqh");
	endfunction

	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		ahb_seqh.start(envh.ahb_toph.agenth[0].seqrh);
		apb_seqh.start(envh.apb_toph.agenth[0].seqrh);
		phase.drop_objection(this);
	endtask

endclass

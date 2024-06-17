//ENVIRONMENT_CLASS
class env extends uvm_env;
   `uvm_component_utils(env)

    env_config m_cfg;

    ahb_agent_top ahb_toph;
    apb_agent_top apb_toph;

    scoreboard sb;
    
    function new(string name = "env", uvm_component parent = null);
  	super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
	super.build_phase(phase);

	if(!uvm_config_db#(env_config)::get(this,"","env_config",m_cfg))
		`uvm_fatal(get_type_name(),"Error in getting ENV CONFIG in environment.")

	if(m_cfg.has_ahb_agent)
	  ahb_toph = ahb_agent_top::type_id::create("ahb_toph", this);

	if(m_cfg.has_apb_agent)
	  apb_toph = apb_agent_top::type_id::create("apb_toph", this);
	
	if(m_cfg.has_scoreboard)
	  sb = scoreboard::type_id::create("sb", this);

   endfunction

endclass



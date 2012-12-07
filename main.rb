require "pp"
require 'yaml'
require File.join(File.expand_path('', __FILE__), "../level1_solar_collector") 
require File.join(File.expand_path('', __FILE__), "../level1_heat_mass") 
require File.join(File.expand_path('', __FILE__), "../level1_living_space") 
# File.dirname(File.absolute_path(__FILE__))
# Dir[File.dirname(File.absolute_path(__FILE__)) + "*.rb"].each {|file| require file}


class SimulationMainLoop
  attr_accessor :names

  # Create the object
  def initialize(names = "Component")
    @names = names
    @sc = SolarCollectorL1.new
    @hm = HeatMassL1.new
    @ls = LivingSpaceL1.new
    read_config
  end

  def read_config
    config = YAML.load_file("param_gh1.yml")
    pp config
    @time_tick = config["master_config"]["time_tick"]
    @number_of_days = config["master_config"]["number_of_days"]
    @sc_area = config["solar_collector"]["sc_area"]
    @begin_earth_temp = config["heat_mass"]["begin_earth_temp"]
    @os_volume = config["occupied_space"]["os_volume"]
  end    
  
  # Output solar collector parameters
  def simulation_params
    if @names.nil?
      puts "..."
    else
      @sc.get_component_name
      @hm.get_component_name
      @ls.get_component_name
      pp "time_tick = ", @time_tick
      pp "os_volume = ", @os_volume
    end
  end
end


if __FILE__ == $0
  sim = SimulationMainLoop.new
  sim.simulation_params
end


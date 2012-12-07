class HeatMassL1
  attr_accessor :names

  # Create the object
  def initialize(names = "Level 1 Heat Mass")
    @names = names
  end

  # Output component name
  def get_component_name
    if @names.nil?
      puts "..."
    else
      puts "Component #{@names}!"
    end
  end
end




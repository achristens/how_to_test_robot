class Robot
  attr_accessor :needs_repairs, :foreign_model, :vintage_model, :todos, :day_off

  def initialize
    @todos = []
  end

  def station
    if needs_repairs && foreign_model
      return 1
    elsif needs_repairs && vintage_model
      return 2
    elsif needs_repairs
      return 3
    else
      return 4
    end
  end

  def prioritize_tasks
    if todos.empty?
      return -1
    else
      return todos.max
    end
  end

  def workday?(today)
    today != day_off
  end

end
# robot = Robot.new
# # puts robot.inspect
# task = "Take out garbage"
# robot.todos << task
# puts robot.todos.inspect



#
# robot.foreign_model  = true
# robot.needs_repairs  = true
#

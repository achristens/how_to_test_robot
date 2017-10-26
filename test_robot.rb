require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # skip
    # arrange
    robot = Robot.new
    robot.foreign_model  = true
    robot.vintage_model  = false
    robot.needs_repairs  = true

    # act
    which_station = robot.station

    # assert
    expected = 1
    assert_equal(expected, which_station)

  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # skip
    robot = Robot.new
    robot.vintage_model  = true
    robot.foreign_model  = false
    robot.needs_repairs  = true

    # act
    which_station = robot.station

    # assert
    expected = 2
    assert_equal(expected, which_station)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # skip
    # arrange
    robot = Robot.new
    robot.needs_repairs  = true
    robot.vintage_model  = false
    robot.foreign_model  = false

    # act
    which_station = robot.station

    # assert
    expected = 3
    assert_equal(expected, which_station)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # skip
    robot = Robot.new
    robot.needs_repairs  = false

    # act
    which_station = robot.station

    # assert
    expected = 4
    assert_equal(expected, which_station)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # skip
    # arrange
    robot = Robot.new

    # act
    empty_list = robot.prioritize_tasks
    # assert
    expected = -1
    assert_equal(expected, empty_list)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # skip
    # arrange
    robot = Robot.new
    task = "Take out garbage"
    robot.todos << task

    # act
    todo_list = robot.prioritize_tasks

    # assert
    expected = "Take out garbage"
    assert_equal(expected, todo_list)
  end

  def test_workday_on_day_off_returns_false
    # skip
    # arrange
    robot = Robot.new
    robot.day_off = "Sunday"

    # act
    result = robot.workday?("Sunday")

    # assert
    expected = false
    assert_equal(expected, result)
  end

  def test_workday_not_day_off_returns_true
    # skip
    # arrange
    robot = Robot.new
    robot.day_off = "Sunday"

    # act
    result = robot.workday?("Monday")

    # assert
    expected = true
    assert_equal(expected, result)
  end

end

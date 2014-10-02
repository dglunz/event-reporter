require_relative 'test_helper'

class IntegrationTest < Minitest::Test
  def output
    @output ||= StringIO.new
  end

  def input
    @input ||= StringIO.new
  end

  def cli
    @cli ||= CLI.new(output)
  end

  def clear_output
    @output.string = ''
  end

  def test_happy_path
    cli.process "load event_attendees.csv"

    cli.process "queue count"

    assert_includes output.string, "0\n"

    clear_output

    cli.process "find first_name john"
    cli.process "queue count"
    assert_includes output.string, "63\n"

    clear_output

    cli.process "queue clear"
    cli.process "queue count"
    assert_includes output.string, "0\n"

    cli.process "help"
    %w[load find queue help].each do |command_name|
    assert_includes output.string, command_name
    end

    cli.process "help queue count"
    assert_includes output.string, "Counts the number of records in the current queue."

    cli.process "help queue print"
    assert_includes output.string, "Prints out a tab-delimited data table"

    clear_output
    cli.process "help queue count"
    refute_includes output.string, "Prints out a tab-delimited data table"
  end

  def test_output
    # load
    cli.process "load"
    # queue count should return 0
    cli.process "queue count"
    assert_includes output.string, "0\n"
    clear_output
    # find first_name John
    cli.process "find first_name john"
    # find first_name Mary
    cli.process "find first_name mary"
    # queue print should print out the 16 attendees
    cli.process "queue count"
    assert_includes output.string, "16\n"
    # queue print by last_name should print the same attendees sorted alphabetically by last name
    cli.process "queue print" #table is displayed in stringio buffer
    # queue count should return 16
    clear_output
    cli.process "queue count"
    assert_includes output.string, "16\n"
  end

  def test_saving
    # load
    cli.process "load"
    # find city Salt Lake City
    cli.process "find city salt lake city"
    # queue print should display 13 attendees
    cli.process "queue count"
    assert_includes output.string, "13\n"
    # queue save to city_sample.csv
    cli.process "queue save to city_sample.csv"
    # Open the CSV and inspect that it has correct headers and the data rows from step 3.
    assert File.exist?('./data/city_sample.csv')

    # find state DC
    cli.process "find state dc"
    # queue print by last_name should print them alphabetically by last name
    cli.process "print by last_name"
    # queue save to state_sample.csv
    cli.process "queue save to state_sample.csv"
    assert File.exist?('./data/state_sample.csv')
    # Open the CSV and inspect that it has the headers, the data from step 7, but not the data previously found in step 2.
    File.delete('./data/state_sample.csv')
    File.delete('./data/city_sample.csv')
  end

  def test_reading_data
    # load
    cli.process "load"
    # find state MD
    cli.process "find state md"
    # queue save to state_sample.csv
    cli.process "queue save to state_sample.csv"
    assert File.exist?('./data/state_sample.csv')
    # quit
    # Restart the program and continue…
    cli = CLI.new(output)

    # load state_sample.csv
    cli.process "load state_sample.csv"
    # find first_name John
    cli.process "find first_name john"
    # queue count should return 4
    cli.process "queue count"
    assert_includes output.string, "4\n"
    File.delete('./data/state_sample.csv')
  end

  def test_emptiness
    # Note that this set intentionally has no call to load:

    # find last_name Johnson
    cli.process "find last_name johnson"
    # queue count should return 0
    cli.process "queue count"
    assert_includes output.string, "0\n"
    clear_output
    # queue print should not print any attendee data
    cli.process "queue print"
    refute_includes output.string, 'johnson'
    clear_output
    # queue clear should not return an error
    cli.process "queue clear"
    # queue print by last_name should not print any data
    cli.process "queue print by last_name"
    refute_includes output.string, 'johnson'
    clear_output
    # queue save to empty.csv should output a file with only headers
    cli.process "queue save to empty.csv"
    # queue count should return 0
    cli.process "queue count"
    assert_includes output.string, "0\n"
    File.delete('./data/empty.csv')
  end

  def test_queue_math
    #load
    cli.process "load"
    #find zipcode 20011
    cli.process "find zipcode 20011"
    #subtract first_name william
    cli.process "subtract first_name william"
    #add zipcode 20010
    cli.process "add zipcode 20010"
    #Observe that there are 8 records in the queue.
    cli.process "queue count"
    assert_includes output.string, "8\n"
  end

  def test_improve_find
    # load
    cli.process "load"
    #find first_name sarah and state CA
    cli.process "find first_name sarah and state ca"
    #Observe that there should only be four records in the queue
    cli.process "queue count"
    assert_includes output.string, "4\n"
  end

  def test_welcome_message
    cli.welcome_message
    assert_includes output.string, "Welcome"
  end

  def test_get_commands
    cli = CLI.new(output, input)
    input.string = 'load'
    cli.get_commands
    assert_equal 'load', cli.commands
  end

  def test_start_menu_can_quit
    cli = CLI.new(output, input)
    input.string = "load\nload\nquit"
    cli.start_menu
  end
end

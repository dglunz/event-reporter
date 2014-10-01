require_relative 'test_helper'

class IntegrationTest < Minitest::Test
  def output
    @output ||= StringIO.new
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

    assert_equal "0\n", output.string

    clear_output

    cli.process("find first_name john")
    cli.process("queue count")
    assert_equal "63\n", output.string

    clear_output

    cli.process("queue clear")
    cli.process("queue count")
    assert_equal "0\n", output.string

    cli.process("help")
    %w[load find queue help].each do |command_name|
    assert_includes output.string, command_name
    end

    cli.process("help queue count")
    assert_includes output.string, "Counts the number of records in the current queue."

    cli.process("help queue print")
    assert_includes output.string, "Prints out a tab-delimited data table"

    clear_output
    cli.process("help queue count")
    refute_includes output.string, "Prints out a tab-delimited data table"
  end

  def test_output
    skip
    # load
    # queue count should return 0
    # find first_name John
    # find first_name Mary
    # queue print should print out the 16 attendees
    # queue print by last_name should print the same attendees sorted alphabetically by last name
    # queue count should return 16
  end

  def test_saving
    skip
    # load
    # find city Salt Lake City
    # queue print should display 13 attendees
    # queue save to city_sample.csv
    # Open the CSV and inspect that it has correct headers and the data rows from step 3.
    # find state DC
    # queue print by last_name should print them alphabetically by last name
    # queue save to state_sample.csv
    # Open the CSV and inspect that it has the headers, the data from step 7, but not the data previously found in step 2.
  end

  def test_reading_data
    skip
    # load
    # find state MD
    # queue save to state_sample.csv
    # quit

    # Restart the program and continue…

    # load state_sample.csv
    # find first_name John
    # queue count should return 4
  end

  def test_emptiness
    skip
    # Note that this set intentionally has no call to load:

    # find last_name Johnson
    # queue count should return 0
    # queue print should not print any attendee data
    # queue clear should not return an error
    # queue print by last_name should not print any data
    # queue save to empty.csv should output a file with only headers
    # queue count should return 0
  end
end

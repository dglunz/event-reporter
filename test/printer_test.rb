require_relative 'test_helper'

class PrinterTest < Minitest::Test
  def output
    @output ||= StringIO.new
  end

  def cli
    @cli ||= CLI.new(output)
  end

  def clear_output
    @output.string = ''
  end

  def after_teardown
    clear_output
  end

  def test_help_printer_basics
    cli.process("help")
    %w[load find queue help].each do |command_name|
    assert_includes output.string, command_name
    end
  end

  def test_help_queue_clear
    cli.process("help queue clear")
    assert_includes output.string, "Empties the queue"
  end

  def test_help_queue_print_by
    cli.process("help queue print by")
    assert_includes output.string, "Prints the data table sorted by the specified <attribute>"
  end

  def test_help_queue_save_to
    cli.process("help queue save to")
    assert_includes output.string, "Exports the current queue to the specified filename"
  end

  def test_help_queue_count
    cli.process("help queue count")
    assert_includes output.string, "Counts the number of records in the current queue."
  end

  def test_help_queue_print
    cli.process("help queue print")
    assert_includes output.string, "Prints out a tab-delimited data table"
  end

  def test_help_printer_load
    cli.process("help load")
    assert_includes output.string, "Erases any loaded data and parses the specified file."
  end

  def test_help_printer_invalid
    cli.process("help adlkfj")
    assert_includes output.string, "adlkfj is an invalid command"
  end

  def test_help_printer_find
    cli.process("help find")
    assert_includes output.string, "Loads the queue with all records matching the criteria"
  end

  def test_help_printer_find
    cli.process("help find")
    assert_includes output.string, "Loads the queue with all records matching the criteria"
  end

  def test_printer_quit
    cli.process("quit")
    assert_includes output.string, "Quit"
  end

  def test_help_printer_find
    cli.process("help find")
    assert_includes output.string, "Loads the queue with all records matching the criteria"
  end
end

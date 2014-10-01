class CLI
  attr_reader :printer,
              :out,
              :input,
              :repository,
              :commands,
              :argument,
              :processor

  def initialize(out=$stdout, input=$stdin)
    @out        = out
    @input      = input
    @printer    = Printer.new
    @commands   = ''
    @processor  = Processor.new(printer, out)
  end

  def start_menu
    welcome_message
    until processor.quit?
      get_commands
      process(commands)
    end
  end

  def process(input)
    processor.process(input)
  end

  def get_commands
    out.printf printer.command_prompt
    @commands = input.gets
  end

  def welcome_message
    out.print printer.clear_screen
    out.puts printer.welcome_message
  end

end

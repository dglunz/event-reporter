class Printer

  def welcome_message
    "Welcome to Event Reporter."
  end

  def start_commands
    "\n(h)elp to list available commands\n(q)uit to exit at any time\n"
  end

  def command_prompt
    "Enter your command:"
  end

  def help
    puts "\nTo access specific instructions enter: help <command name>"
    puts "\nAvailable commands:
    \nqueue:
    \n\tqueue count
    \n\tqueue clear
    \n\tqueue print
    \n\tqueue print by
    \n\tqueue save to"
    puts "\nload"
    puts "\nfind"
  end

  def help_load
    "'load <filename>' \n Erases any loaded data and parses the specified file. If no filename is given, default loads to event_attendees.csv"
  end

  def help_queue_count
    "Outputs how many records are in the current queue."
  end

  def help_queue_clear
    "HIT"
  end

  def help_queue_print
    "Prints out a tab-delimited data table with a header row following this format:\n
    LAST NAME\tFIRST\tNAME\tEMAIL\tZIPCODE\tCITY\tSTATE\tADDRESS\tPHONE"
  end

  def help_queue_print_by
    "'queue print by <attribute>' Prints the data table sorted by the specified <attribute> like 'zipcode'"
  end

  def help_queue_save_to
    "'queue save to <filename.csv>' Exports the current queue to the specified filename as a CSV. The file includes headers for last name, first name, email, zipcode, city, state, address, and phone number followed by data."
  end

  def help_find
    "'find <attribute> <criteria>' Loads the queue with all records matching the criteria for the given attribute. Example usages:\n
    \t'find zipcode 20011'
    \t'find last_name Johnson'
    \t'find state VA'\n
    "
  end

  def invalid_command(command)
    "#{command} is an invalid command. See 'help' for a list of available commands."
  end

end

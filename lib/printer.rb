class Printer

  def welcome_message
    "Welcome to Event Reporter!
    \n'help' to list available commands\n'quit' to exit at any time\n"
  end

  def command_prompt
    "\nEnter your command: "
  end

  def quit
    "\nQuitting...\n"
  end

  def help
    "\nTo access specific instructions enter: 'help <command name>'
    \nAvailable commands: \
    \n  queue count \
    \n  queue clear \
    \n  queue print \
    \n  queue print by \
    \n  queue save to \
    \n  load \
    \n  find"
  end

  def help_load
    "'load <filename>' \n Erases any loaded data and parses the specified file. If no filename is given, default loads to event_attendees.csv"
  end

  def help_queue_count
    "Counts the number of records in the current queue."
  end

  def help_queue_clear
    "Empties the queue"
  end

  def help_queue_print
    "Prints out a tab-delimited data table with a header row following this format:\n \
    LAST NAME\tFIRST\tNAME\tEMAIL\tZIPCODE\tCITY\tSTATE\tADDRESS\tPHONE"
  end

  def help_queue_print_by
    "'queue print by <attribute>' Prints the data table sorted by the specified <attribute> like 'zipcode'"
  end

  def help_queue_save_to
    "'queue save to <filename.csv>' Exports the current queue to the specified filename as a CSV. The file includes headers for last name, first name, email, zipcode, city, state, address, and phone number followed by data."
  end

  def help_find
    "'find <attribute> <criteria>' Loads the queue with all records matching the criteria for the given attribute. Example usages:\n \
    \n  'find zipcode 20011' \
    \n  'find last_name Johnson' \
    \n  'find state VA' \
    "
  end

  def file_loaded
    "File loaded"
  end

  def queue_loaded
    "Queue loaded"
  end

  def queue_updated
    "Queue updated"
  end

   def queue_cleared
    "Queue cleared"
   end

  def invalid_command(command)
    "#{command} is an invalid command. See 'help' for a list of available commands."
  end

  def clear_screen
    "\e[2J\e[f"
  end

end

require 'terminal-table'

class Table
  attr_reader :queue
  def initialize(queue)
    @queue  = queue
    @title  = "Results"
    @header = ["ID",
               "Reg Date",
               "First Name",
               "Last Name",
               "Email Address",
               "HomePhone",
               "Street",
               "City",
               "State",
               "Zipcode"
               ]
    @rows   = []
    queue_to_row
  end

  def create_table
    table = Terminal::Table.new :title => @title,
                                :headings => @header,
                                :rows => @rows
  end

  def queue_to_row
    queue.each do |entry|
      @rows << [entry.id,
                entry.regdate,
                entry.first_name.capitalize,
                entry.last_name.capitalize,
                entry.email_address,
                "(#{entry.homephone[0..2]}) #{entry.homephone[3..5]}-#{entry.homephone[6..-1]}",
                entry.street.split.map { |i| i.capitalize }.join(' '),
                entry.city.capitalize,
                entry.state.upcase,
                entry.zipcode
              ]
    end
  end
end

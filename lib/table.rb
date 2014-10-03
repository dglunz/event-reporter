require 'terminal-table'

class Table
  attr_reader :queue,
              :row,
              :row_next

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
    @rows     = []
    @row      = 0
    @row_next = 0
    queue_to_rows
  end

  def create_table
    increase_rows
    table = Terminal::Table.new :title => @title,
                                :headings => @header,
                                :rows => @rows[row..row_next-1]
  end

  def increase_table
    increase_rows
    table = Terminal::Table.new :rows => @rows[row..row_next-1]
  end

  def queue_to_rows
    queue.each do |entry|
      @rows << [entry.id,
                entry.regdate,
                entry.first_name.capitalize,
                entry.last_name.capitalize,
                entry.email_address,
                phone(entry),
                street(entry),
                entry.city.capitalize,
                entry.state.upcase,
                entry.zipcode
              ]
    end
  end

  def increase_rows
    @row = row_next
    above_row_limit? ? (@row_next = queue.count) : @row_next += 10
  end

  def above_row_limit?
    row + 10 > queue.count
  end

  def phone(entry)
    "(#{entry.homephone[0..2]}) #{entry.homephone[3..5]}-#{entry.homephone[6..-1]}"
  end

  def street(entry)
    entry.street.split.map { |i| i.capitalize }.join(' ')
  end
end

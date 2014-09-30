require 'terminal-table'

class Table
  attr_reader :queue
  def initialize(queue)
    @queue  = queue
    @title  = "Results"
    @header = %w(ID RegDate first_Name last_Name Email_Address HomePhone Street City State Zipcode)
    @rows   = []
    queue_to_row
  end

  def create_table
    table = Terminal::Table.new :title => @title,
                                :headings => @header,
                                :rows => @rows
    puts table
  end

  def queue_to_row

    queue.each do |entry|
      @rows << [entry.id, entry.regdate, entry.first_name.capitalize, entry.last_name.capitalize, entry.email_address, entry.homephone, entry.street, entry.city, entry.state, entry.zipcode]
    end
  end
end

class Executor
  def load_file(path="event_attendees.csv")
    if File.exist?("./data/#{path}")
      csv = Loader.new(path)
      @repository = Repository.new(csv.attendees)
      out.puts printer.file_loaded
    else
      out.puts printer.file_not_found
    end
  end

  def find
    if single_find_criteria?
      repository.find_by(attribute, criteria)
    else
      repository.find_by(attribute, parse_criteria)
      repository.narrow_results_by(parse_attribute, parse_second_criteria)
    end
    out.puts printer.queue_loaded
  end

  def subtract
    repository.subtract_results_by(attribute, criteria)
    out.puts printer.queue_updated
  end

  def add
    repository.add_results_by(attribute, criteria)
    out.puts printer.queue_updated
  end

  def print_by
    sort_column = argument.last
    valid_attribute?(sort_column) ? repository.sort_by(sort_column) :  sort_column = "first_name"

    results = Table.new(repository.queue)
    out.puts results.create_table
    out.puts printer.pagination(results)

    @scroll = gets

    while more_results?(results)
      out.puts results.increase_table
      out.puts printer.pagination(results)
      @scroll = gets
    end
  end

  def more_results?(results)
    @scroll == "\n" && results.row_next != results.queue.count
  end

  def count
    out.puts repository.queue_count
  end

  def clear
    repository.queue_clear; out.puts printer.queue_cleared
  end

  def save
    file_name = argument.last
    Saver.new.save_file(repository.queue, file_name)
  end

end

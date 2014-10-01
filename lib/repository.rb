class Repository
	attr_reader :attendees,
							:queue

	def initialize(attendees=[])
		@queue = []
		@attendees = attendees
	end

	def find_by(attribute, criteria)
		@queue = attendees.find_all { |entry| entry.send(attribute.to_sym) == criteria }
	end

	def narrow_results_by(second_attribute, second_criteria)
		@queue = queue.find_all { |entry| entry.send(second_attribute.to_sym) == second_criteria }
	end

	def add_results_by(attribute, criteria)
		(@queue << attendees.find_all { |entry| entry.send(attribute.to_sym) == criteria }).flatten!
	end

	def subtract_results_by(attribute, criteria)
		@queue = queue.reject { |entry| entry.send(attribute.to_sym) == criteria }
	end

	def queue_clear
		@queue.clear
	end

	def queue_count
		@queue.count
	end

	def queue_print
		table = Table.new(queue)
		table.create_table
	end

	def sort_by(attribute)
		@queue.sort! {|entry1, entry2| entry1.send(attribute.to_sym) <=> entry2.send(attribute.to_sym) }
	end
end

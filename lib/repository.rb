class Repository
	attr_reader :attendees

	def initialize(attendees)
		@queue = []
		@attendees = attendees
	end

	def find_by(attribute, criteria)
		@queue = attendees.find_all { |entry| entry.send(attribute.to_sym) == criteria }
	end

	def queue_clear
		@queue.clear
	end

	def queue_count
		@queue.count
	end
end

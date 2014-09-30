class Repository
	attr_reader :attendees

	def initialize(attendees)
		@queue = []
		@attendees = attendees
	end

	def find_by_first_name(first_name)
		@queue = attendees.find_all { |entry| entry.first_name == first_name }
	end

end
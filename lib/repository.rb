class Repository
	attr_reader :attendees

	def initialize(attendees)
		@queue = []
		@attendees = attendees
	end

	def find_by_first_name(first_name)
		@queue = attendees.find_all { |entry| entry.first_name.downcase == first_name.downcase }
	end

	def find_by_regdate(regdate)
		@queue = attendees.find_all { |entry| entry.regdate == redate }
	end

	def find_by_last_name(last_name)
		@queue = attendees.find_all { |entry| entry.last_name.downcase == last_name.downcase }
	end

	def find_by_email_address(email_address)
		@queue = attendees.find_all { |entry| entry.email_address == email_address }
	end

	def find_by_homephone(homephone)
		@queue = attendees.find_all { |entry| entry.homephone == homephone }
	end

	def find_by_street(street)
		@queue = attendees.find_all { |entry| entry.street == street }
	end

	def find_by_city(city)
		@queue = attendees.find_all { |entry| entry.city.downcase == city.downcase }
	end

	def find_by_state(state)
		@queue = attendees.find_all { |entry| entry.state.downcase == state.downcase }
	end

	def find_by_zipcode(zipcode)
		@queue = attendees.find_all { |entry| entry.zipcode == zipcode }
	end
end

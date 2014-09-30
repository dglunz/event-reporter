class Repository
	attr_reader :attendees

	def initialize(attendees)
		@queue = []
		@attendees = attendees
	end

	# def find_by_registration_date(regdate)
	# 	@queue = attendees.find_all { |entry| entry.regdate == regdate }
	# end

	def find_by_first_name(first_name)
		@queue = attendees.find_all { |entry| entry.first_name == first_name }
	end

	def find_by_last_name(last_name)
		@queue = attendees.find_all { |entry| entry.last_name == last_name }
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
		@queue = attendees.find_all { |entry| entry.city == city }
	end

	def find_by_state(state)
		@queue = attendees.find_all { |entry| entry.state == state }
	end

	def find_by_zipcode(zipcode)
		@queue = attendees.find_all { |entry| entry.zipcode == zipcode }
	end
end

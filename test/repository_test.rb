require_relative 'test_helper'

class Repository < MiniTest::Test 

	def test_find_by_first_name
		attendees = { id: "1", reg_date: "11/12/08 10:47", first_name: "Allison", last_name: "Nguyen", email_address: "arannon@jumpstartlab.com", homephone: "6154385000", street: "3155 19th St NW", city: "Washington", state: "DC", zipcode: "20010",
								 id: "2", reg_date: "11/12/08 13:23", first_name: "SArah", last_name: "Hankins", email_address: "pinalevitsky@jumpstartlab.com", homephone: "414-520-5000", street: "2022 15th Street NW", city: "Washington", state: "DC", zipcode: "20009", 
								 id: "3", reg_date: "11/12/08 13:30,", first_name: "Sarah", last_name: "Xx", email_address: "lqrm4462@jumpstartlab.com", homephone: "(941)979-2000", street: "4175 3rd Street North", city: "Saint Petersburg", state: "FL", zipcode: "33703"
			].map { |row| Entry.new(row) }

		repository = Repository.new(attendees)
		queue = repository.find_by_first_name("Allison")

		assert_equal "Allison", queue[0].first_name
		assert_equal "Nguyen", queue[0].last_name
		assert_equal "6154385000", queue[0].homephone
		assert_equal 1, queue.count
	end

	def test_find_by_registration_date
		skip
		# load csv and convert to attendee array of entry objects
		# create repo object to access repo methods
		# use find methods to get queue
		# validate
	end

	def test_find_by_last_name
		skip
	end

	def test_find_by_email_address
		skip
	end

	def test_find_by_homephone
		skip
	end

	def test_find_by_street
		skip
	end

	def test_find_by_city
		skip
	end

	def test_find_by_state
		skip
	end

	def test_find_by_zipcode
		skip
	end
end

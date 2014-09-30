require_relative 'test_helper'

class Repository < MiniTest::Test 

	def test_find_by_first_name
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
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

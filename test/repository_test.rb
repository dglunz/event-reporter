require_relative 'test_helper'

class RepositoryTest < MiniTest::Test 

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
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
		queue = repository.find_by_regdate("11/12/08 13:23")

		assert_equal "SArah", queue[0].first_name
		assert_equal "11/12/08 13:23", queue[0].regdate
		assert_equal "pinalevitsky@jumpstartlab.com", queue[0].email_address
		assert_equal "Washington", queue[0].city
		assert_equal 1, queue.count
	end

	def test_find_by_last_name
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
		queue = repository.find_by_last_name("Hankins")

		assert_equal "SArah", queue[0].first_name
		assert_equal "pinalevitsky@jumpstartlab.com", queue[0].email_address
		assert_equal "Washington", queue[0].city
		assert_equal 1, queue.count
	end

	def test_find_by_email_address
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
		queue = repository.find_by_email_address("pinalevitsky@jumpstartlab.com")

		assert_equal "SArah", queue[0].first_name
		assert_equal "20009", queue[0].zipcode
		assert_equal "DC", queue[0].state
		assert_equal 1, queue.count
	end

	def test_find_by_homephone
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
		queue = repository.find_by_homephone("6154385000")

		assert_equal "Allison", queue[0].first_name
		assert_equal "Nguyen", queue[0].last_name
		assert_equal "3155 19th St NW", queue[0].street
		assert_equal 1, queue.count
	end

	def test_find_by_street
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
		queue = repository.find_by_street("4175 3rd Street North")

		assert_equal "Sarah", queue[0].first_name
		assert_equal "Xx", queue[0].last_name
		assert_equal "Saint Petersburg", queue[0].city
		assert_equal 1, queue.count
	end

	def test_find_by_city
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
		queue = repository.find_by_city("Saint Petersburg")

		assert_equal "Sarah", queue[0].first_name
		assert_equal "Xx", queue[0].last_name
		assert_equal "FL", queue[0].state
		assert_equal 1, queue.count
	end

	def test_find_by_state
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
		queue = repository.find_by_state("FL")

		assert_equal "Sarah", queue[0].first_name
		assert_equal "Xx", queue[0].last_name
		assert_equal "33703", queue[0].zipcode
		assert_equal 1, queue.count
	end

	def test_find_by_zipcode
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
		queue = repository.find_by_zipcode("33703")

		assert_equal "Sarah", queue[0].first_name
		assert_equal "Xx", queue[0].last_name
		assert_equal "33703", queue[0].zipcode
		assert_equal 1, queue.count
	end

	def test_find_by_case_insensitive_first_name
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
		queue = repository.find_by_first_name("sarah")

		assert_equal "SArah", queue[0].first_name
		assert_equal 2, queue.count
	end

	def test_find_by_case_insensitive_last_name
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
		queue = repository.find_by_last_name("hankins")

		assert_equal "Hankins", queue[0].last_name
		assert_equal 1, queue.count
	end

		def test_find_by_case_insensitive_city
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
		queue = repository.find_by_city("SAint petersburg")

		assert_equal "Saint Petersburg", queue[0].city
		assert_equal 1, queue.count
	end

	def test_find_by_case_insensitive_state
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
		queue = repository.find_by_state("fl")

		assert_equal "FL", queue[0].state
		assert_equal 1, queue.count
	end

	def test_queue_count
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
		queue = repository.find_by_first_name("sarah")

		assert_equal 2, repository.queue_count
	end

	def test_queue_clear
		csv = Loader.new("../data/test.csv")

		repository = Repository.new(csv.attendees)
		queue = repository.find_by_first_name("sarah")

		assert_equal 2, repository.queue_count

		repository.queue_clear 

		assert_equal [], repository.queue_clear
		assert_equal 0, repository.queue_count
	end
end
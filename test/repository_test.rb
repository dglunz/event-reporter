require_relative 'test_helper'

class RepositoryTest < MiniTest::Test
	def csv
		@csv = Loader.new("test.csv")
	end

	def repository
		@repository = Repository.new(csv.attendees)
	end

	def test_find_by_first_name
		attribute  = "first_name"
		criteria   = "allison"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "allison", queue[0].first_name
		assert_equal "nguyen", queue[0].last_name
		assert_equal "6154385000", queue[0].homephone
		assert_equal 1, queue.count
	end

	def test_find_by_registration_date
		attribute  = "regdate"
		criteria   = "11/12/08 13:23"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "sarah", queue[0].first_name
		assert_equal "11/12/08 13:23", queue[0].regdate
		assert_equal "pinalevitsky@jumpstartlab.com", queue[0].email_address
		assert_equal "washington", queue[0].city
		assert_equal 1, queue.count
	end

	def test_find_by_last_name
		attribute  = "last_name"
		criteria   = "hankins"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "sarah", queue[0].first_name
		assert_equal "pinalevitsky@jumpstartlab.com", queue[0].email_address
		assert_equal "washington", queue[0].city
		assert_equal 1, queue.count
	end

	def test_find_by_email_address
		attribute  = "email_address"
		criteria   = "pinalevitsky@jumpstartlab.com"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "sarah", queue[0].first_name
		assert_equal "20009", queue[0].zipcode
		assert_equal "dc", queue[0].state
		assert_equal 1, queue.count
	end

	def test_find_by_homephone
		attribute  = "homephone"
		criteria   = "6154385000"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "allison", queue[0].first_name
		assert_equal "nguyen", queue[0].last_name
		assert_equal "3155 19th st nw", queue[0].street
		assert_equal 1, queue.count
	end

	def test_find_by_street
		attribute  = "street"
		criteria   = "4175 3rd street north"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "sarah", queue[0].first_name
		assert_equal "xx", queue[0].last_name
		assert_equal "saint petersburg", queue[0].city
		assert_equal 1, queue.count
	end

	def test_find_by_city
		attribute  = "city"
		criteria   = "saint petersburg"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "sarah", queue[0].first_name
		assert_equal "xx", queue[0].last_name
		assert_equal "fl", queue[0].state
		assert_equal 1, queue.count
	end

	def test_find_by_state
		attribute  = "state"
		criteria   = "fl"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "sarah", queue[0].first_name
		assert_equal "xx", queue[0].last_name
		assert_equal "33703", queue[0].zipcode
		assert_equal 1, queue.count
	end

	def test_find_by_zipcode
		attribute  = "zipcode"
		criteria   = "33703"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "sarah", queue[0].first_name
		assert_equal "xx", queue[0].last_name
		assert_equal "33703", queue[0].zipcode
		assert_equal 1, queue.count
	end

	def test_queue_count
		repository = Repository.new(csv.attendees)
		attribute  = "first_name"
		criteria   = "sarah"
		queue      = repository.find_by(attribute, criteria)

		assert_equal 2, repository.queue_count
	end

	def test_queue_clear
		repository = Repository.new(csv.attendees)
		attribute  = "first_name"
		criteria   = "sarah"
		queue      = repository.find_by(attribute, criteria)

		assert_equal 2, repository.queue_count

		repository.queue_clear

		assert_equal [], repository.queue_clear
		assert_equal 0, repository.queue_count
	end

	def test_sort_by_last_name
		repository = Repository.new(csv.attendees)

		repository.find_by("first_name", "sarah")

		assert_equal 2, repository.queue_count

		repository.sort_by("last_name")

		assert_equal "hankins", repository.queue[0].last_name
		assert_equal "saint petersburg", repository.queue[1].city
	end

	def test_sort_by_city
		repository = Repository.new(csv.attendees)
		attribute  = "city"

		repository.find_by("first_name", "sarah")

		repository.sort_by(attribute)

		assert_equal "xx", repository.queue[0].last_name
		assert_equal "washington", repository.queue[1].city
	end

	def test_sort_by_homephone
		repository = Repository.new(csv.attendees)
		attribute  = "homephone"

		repository.find_by("first_name", "sarah")

		repository.sort_by(attribute)

		assert_equal "hankins", repository.queue[0].last_name
		assert_equal "saint petersburg", repository.queue[1].city
	end

end

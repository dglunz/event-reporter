require_relative 'test_helper'

class RepositoryTest < MiniTest::Test 

	def test_find_by_first_name
		csv        = Loader.new("../data/test.csv")
		repository = Repository.new(csv.attendees)
		attribute  = "first_name"
		criteria   = "allison"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "allison", queue[0].first_name
		assert_equal "nguyen", queue[0].last_name
		assert_equal "6154385000", queue[0].homephone
		assert_equal 1, queue.count
	end

	def test_find_by_registration_date
		csv        = Loader.new("../data/test.csv")
		repository = Repository.new(csv.attendees)
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
		csv        = Loader.new("../data/test.csv")
		repository = Repository.new(csv.attendees)
		attribute  = "last_name"
		criteria   = "hankins"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "sarah", queue[0].first_name
		assert_equal "pinalevitsky@jumpstartlab.com", queue[0].email_address
		assert_equal "washington", queue[0].city
		assert_equal 1, queue.count
	end

	def test_find_by_email_address
		csv        = Loader.new("../data/test.csv")
		repository = Repository.new(csv.attendees)
		attribute  = "email_address"
		criteria   = "pinalevitsky@jumpstartlab.com"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "sarah", queue[0].first_name
		assert_equal "20009", queue[0].zipcode
		assert_equal "dc", queue[0].state
		assert_equal 1, queue.count
	end

	def test_find_by_homephone
		csv        = Loader.new("../data/test.csv")
		repository = Repository.new(csv.attendees)
		attribute  = "homephone"
		criteria   = "6154385000"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "allison", queue[0].first_name
		assert_equal "nguyen", queue[0].last_name
		assert_equal "3155 19th st nw", queue[0].street
		assert_equal 1, queue.count
	end

	def test_find_by_street
		csv        = Loader.new("../data/test.csv")
		repository = Repository.new(csv.attendees)
		attribute  = "street"
		criteria   = "4175 3rd street north"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "sarah", queue[0].first_name
		assert_equal "xx", queue[0].last_name
		assert_equal "saint petersburg", queue[0].city
		assert_equal 1, queue.count
	end

	def test_find_by_city
		csv        = Loader.new("../data/test.csv")
		repository = Repository.new(csv.attendees)
		attribute  = "city"
		criteria   = "saint petersburg"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "sarah", queue[0].first_name
		assert_equal "xx", queue[0].last_name
		assert_equal "fl", queue[0].state
		assert_equal 1, queue.count
	end

	def test_find_by_state
		csv        = Loader.new("../data/test.csv")
		repository = Repository.new(csv.attendees)
		attribute  = "state"
		criteria   = "fl"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "sarah", queue[0].first_name
		assert_equal "xx", queue[0].last_name
		assert_equal "33703", queue[0].zipcode
		assert_equal 1, queue.count
	end

	def test_find_by_zipcode
		csv        = Loader.new("../data/test.csv")
		repository = Repository.new(csv.attendees)
		attribute  = "zipcode"
		criteria   = "33703"
		queue      = repository.find_by(attribute, criteria)

		assert_equal "sarah", queue[0].first_name
		assert_equal "xx", queue[0].last_name
		assert_equal "33703", queue[0].zipcode
		assert_equal 1, queue.count
	end

	def test_queue_count
		csv        = Loader.new("../data/test.csv")
		repository = Repository.new(csv.attendees)
		attribute  = "first_name"
		criteria   = "sarah"
		queue      = repository.find_by(attribute, criteria)

		assert_equal 2, repository.queue_count
	end

	def test_queue_clear
		csv        = Loader.new("../data/test.csv")
		repository = Repository.new(csv.attendees)
		attribute  = "first_name"
		criteria   = "sarah"
		queue      = repository.find_by(attribute, criteria)

		assert_equal 2, repository.queue_count

		repository.queue_clear 

		assert_equal [], repository.queue_clear
		assert_equal 0, repository.queue_count
	end

	# def test_sort_by_last_name
	# 	csv 			 = Loader.new("../data/test.csv")
	# 	repository = Repository.new(csv.attendees)
	# 	attribute  = "last_name"
	# 	queue      = repository.find_by_first_name("sarah")

	# 	queue.sort_by(attribute)

	# 	assert_equal "hankins", queue[0].last_name
	# 	assert_equal "saint petersburg", queue[1].city
	# end

	# def test_sort_by_city
	# 	csv 			 = Loader.new("../data/test.csv")
	# 	repository = Repository.new(csv.attendees)
	# 	attribute  = "last_name"
	# 	queue      = repository.find_by_first_name("sarah")

	# 	queue.sort_by(attribute)

	# 	assert_equal "xx", queue[0].last_name
	# 	assert_equal "washington", queue[1].city
	# end

	# def test_sort_by_homephone
	# 	csv 			 = Loader.new("../data/test.csv")
	# 	repository = Repository.new(csv.attendees)
	# 	attribute  = "last_name"
	# 	queue      = repository.find_by_first_name("sarah")

	# 	queue.sort_by(attribute)

	# 	assert_equal "hankins", queue[0].last_name
	# 	assert_equal "saint petersburg", queue[1].city
	# end

end
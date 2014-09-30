require_relative 'test_helper'

class RepositoryTest < MiniTest::Test 

	def test_entry_attributes

		data = { regdate: "11/12/08 10:47", 
						 first_name: "Allison", 
						 last_name: "Nguyen", 
						 email_address: "arannon@jumpstartlab.com", 
						 homephone: "6154385000", 
						 street: "3155 19th St NW", 
						 city: "Washington", 
						 state: "DC", 
						 zipcode: "20010"
						}

		entry = Entry.new(data)

		assert_equal "11/12/08 10:47", entry.regdate
		assert_equal "allison", entry.first_name
		assert_equal "nguyen", entry.last_name
		assert_equal "arannon@jumpstartlab.com", entry.email_address
		assert_equal "6154385000", entry.homephone
		assert_equal "3155 19th st nw", entry.street
		assert_equal "washington", entry.city
		assert_equal "dc", entry.state
		assert_equal "20010", entry.zipcode
	end
end